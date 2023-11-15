import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practica_obligatoria2/models/pokedex_models.dart';
import 'package:practica_obligatoria2/presentations/widgets/info_pokemon_widget.dart';
import 'package:practica_obligatoria2/providers/provider_pokeapi.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../models/pokemon_models.dart';
import '../widgets/loading_page_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<Pokedex> listadoPokedex = [];
  List<Pokedex> listadoPokemon = [];
  late AudioPlayer _audioPlayer;
  late Pokemon pokemon;
  bool isGenerationSelected = false;
  bool isPokemonSelected = false;
  int lastPokemonGeneration = 0;
  int indexPokemonGeneration = 0;
  final Map<int, int> pokemonInGeneration = {
    //El 0 es la primera gen el 1 la segunda...
    0: 151,
    1: 251,
    2: 386,
    3: 493,
    4: 649,
    5: 721,
    6: 809,
    7: 905,
    8: 1008
  };
  final List<String> imagePaths = [
    "assets/firstGenerationBox.png",
    "assets/secondGenerationBox.png",
    "assets/thirdGenerationBox.png",
    "assets/fourthGenerationBox.png",
    "assets/fifthGenerationBox.png",
    "assets/sixthGenerationBox.png",
    "assets/seventhGenerationBox.png",
    "assets/eighthGenerationBox.png",
    "assets/ninthGenerationBox.png",
  ];

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    // Llama a la función para cargar los datos al principio
    if (listadoPokedex.isEmpty) {
      loadPokedexData();
      playLoadingAudio(); // Add this line
    }
  }

  Future<void> playLoadingAudio() async {
    try {
      await _audioPlayer.play(AssetSource('audioIntro.mp3'));
    // ignore: empty_catches
    } catch (error) {
    
    }
  }

  Future<void> loadPokedexData() async {
    try {
      List<Pokedex> loadedPokemons = await ProviderPokeApi().getPokedex();
      setState(() {
        // Actualiza el estado con los datos cargados
        listadoPokedex = loadedPokemons;
      });
    // ignore: empty_catches
    } catch (error) {

   
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    if (listadoPokedex.isEmpty) {
      // Muestra un indicador de carga mientras se obtienen los datos
      return LoadingPage(topPadding: screenHeight * 0.65);
    } else {
      // Muestra la lista de Pokémon después de cargar los datos
      if (!isGenerationSelected) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.redAccent,
              leading: isGenerationSelected
                  ? isPokemonSelected
                      ? IconButton(
                          onPressed: () => {
                            setState(() {
                              isPokemonSelected = false;
                            })
                          },
                          icon: const Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                          ),
                        )
                      : IconButton(
                          onPressed: () => {
                            setState(() {
                              isGenerationSelected = false;
                              listadoPokemon = [];
                            })
                          },
                          icon: const Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                          ),
                        )
                  : const IconButton(
                      onPressed: null,
                      isSelected: true,
                      icon: Icon(
                        null,
                      ),
                    ),
              title: Padding(
                padding: EdgeInsets.only(right: screenWidth * 0.15),
                child: Image.asset(
                  "assets/tituloAppbar.png",
                  height:
                      kToolbarHeight, // Establece la altura de la imagen igual a la altura de la AppBar
                ),
              ),
              centerTitle: true,
              titleSpacing: 0.0,
            ),
            body: ListView.builder(
                itemCount: imagePaths.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation:
                            0, // Establece el color de fondo a transparente
                      ),
                      onPressed: () => {
                        setState(() {
                          lastPokemonGeneration = pokemonInGeneration[index]!;
                          indexPokemonGeneration =
                              pokemonInGeneration[index]! == 151
                                  ? 0
                                  : pokemonInGeneration[index - 1]!;
                          isGenerationSelected = true;

                          for (var i = indexPokemonGeneration;
                              i < lastPokemonGeneration;
                              i++) {
                            listadoPokemon.add(listadoPokedex[i]);
                          }
                        })
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          imagePaths[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
          ),
        );
      } else {
        if (!isPokemonSelected) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.redAccent,
                leading: isGenerationSelected
                    ? isPokemonSelected
                        ? IconButton(
                            onPressed: () => {
                              setState(() {
                                isPokemonSelected = false;
                              })
                            },
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.white,
                            ),
                          )
                        : IconButton(
                            onPressed: () => {
                              setState(() {
                                isGenerationSelected = false;
                                listadoPokemon = [];
                              })
                            },
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.white,
                            ),
                          )
                    : const IconButton(
                        onPressed: null,
                        isSelected: true,
                        icon: Icon(
                          null,
                        ),
                      ),
                title: Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.15),
                  child: Image.asset(
                    "assets/tituloAppbar.png",
                    height:
                        kToolbarHeight, // Establece la altura de la imagen igual a la altura de la AppBar
                  ),
                ),
                centerTitle: true,
                titleSpacing: 0.0,
              ),
              body: ListView.builder(
                itemCount: listadoPokemon.length,
                padding: const EdgeInsets.all(10),
                itemBuilder: (_, index) => Card(
                  elevation: 0, // Ajusta la elevación según tus preferencias
                  child: ElevatedButton(
                    onPressed: () async {
                      isPokemonSelected = true;
                      pokemon = await ProviderPokeApi()
                          .getPokemon(listadoPokemon[index].url);
                      setState(() {});
                    },
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: Image.asset('assets/pokeball.png').image,
                            height: screenHeight * 0.04,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width: screenWidth * 0.15,
                                    child: Text(
                                        '#${indexPokemonGeneration + index + 1}')),
                                SizedBox(
                                    width: screenWidth * 0.3,
                                    child:
                                        Text(' ${listadoPokemon[index].name}')),
                              ]),
                          Image(
                            image: Image.asset('assets/pokeball.png').image,
                            height: screenHeight * 0.04,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.redAccent,
                leading: isGenerationSelected
                    ? isPokemonSelected
                        ? IconButton(
                            onPressed: () => {
                              setState(() {
                                isPokemonSelected = false;
                              })
                            },
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.white,
                            ),
                          )
                        : IconButton(
                            onPressed: () => {
                              setState(() {
                                isGenerationSelected = false;
                                listadoPokemon = [];
                              })
                            },
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.white,
                            ),
                          )
                    : const IconButton(
                        onPressed: null,
                        isSelected: true,
                        icon: Icon(
                          null,
                        ),
                      ),
                title: Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.15),
                  child: Image.asset(
                    "assets/tituloAppbar.png",
                    height:
                        kToolbarHeight, // Establece la altura de la imagen igual a la altura de la AppBar
                  ),
                ),
                centerTitle: true,
                titleSpacing: 0.0,
              ),
              body: InfoPokemon(
                  pokemon: pokemon,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth),

              // Otros elementos de ListTile, según tus necesidades
            ),
          );
        }
      }
    }
  }
}
