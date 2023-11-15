import 'package:flutter/material.dart';

import '../../models/pokemon_models.dart';
import 'draw_pokemon_type.dart';

class InfoPokemon extends StatefulWidget {
  const InfoPokemon({
    Key? key,
    required this.pokemon,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  final Pokemon pokemon;
  final double screenHeight;
  final double screenWidth;

  @override
  _InfoPokemonState createState() => _InfoPokemonState();
}

class _InfoPokemonState extends State<InfoPokemon> {
  bool _showLoading = true;
  bool isDefault = true;

  @override
  void initState() {
    super.initState();
    // Agregar un retraso de 2 segundos antes de mostrar la imagen
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _showLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String urlDefaultImage =
        widget.pokemon.sprites.other!.officialArtwork.frontDefault;
    String urlShinyImage =
        widget.pokemon.sprites.other!.officialArtwork.frontShiny;
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              _showLoading
                  ? Padding(
                      padding: EdgeInsets.only(
                          left: widget.screenWidth * 0.05,
                          top: widget.screenHeight * 0.02),
                      child: Image.asset(
                        "assets/poke_loading.gif",
                        height: widget.screenWidth * 0.4,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                          left: widget.screenWidth * 0.05,
                          top: widget.screenHeight * 0.02),
                      child: Image.network(
                        isDefault ? urlDefaultImage : urlShinyImage,
                        height: widget.screenHeight * 0.20,
                      ),
                    ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: widget.screenWidth * 0.05),
                  child: Column(
                    children: [
                      Text(
                        "${widget.pokemon.name.toUpperCase()} #${widget.pokemon.id}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: widget.screenWidth * 0.045),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DrawType(widget: widget, posType: 0),
                            SizedBox(width: widget.screenWidth * 0.02),
                            widget.pokemon.types.length > 1
                                ? DrawType(widget: widget, posType: 1)
                                : Container(),
                          ],
                        ),
                      ),
                      Text("Height: ${widget.pokemon.height / 10} m"),
                      Text("Weight: ${widget.pokemon.weight / 10} kg"),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: widget.screenHeight * 0.02),
          Text(
            '${isDefault ? "Shiny" : "Default"} Image',
            style: TextStyle(fontSize: widget.screenWidth * 0.04),
          ),
          Switch(
            value: isDefault,
            onChanged: (value) {
              setState(() {
                isDefault = value;
              });
            },
            activeTrackColor: Colors.blueGrey[100],
            activeColor: Colors.blueGrey[600],
          ),
          SizedBox(height: widget.screenHeight * 0.02),
          Text(
            "LIST OF MOVES",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: widget.screenWidth * 0.07,
                decoration: TextDecoration.underline),
          ),
          SizedBox(height: widget.screenHeight * 0.02),
          Expanded(
            child: Container(
              margin:
                  EdgeInsets.symmetric(horizontal: widget.screenWidth * 0.12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[200],
              ),
              child: ListView.builder(
                itemCount: widget.pokemon.moves.length,
                itemBuilder: (context, index) {
                  final move = widget.pokemon.moves[index].move;
                  return ListTile(
                    title: Text(
                      move.name,
                      style: TextStyle(fontSize: widget.screenWidth * 0.04),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
