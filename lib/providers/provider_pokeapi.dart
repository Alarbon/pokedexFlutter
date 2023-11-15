import 'package:http/http.dart';
import 'package:practica_obligatoria2/models/pokedex_models.dart';
import 'package:practica_obligatoria2/models/pokemon_models.dart';

import '../models/response_pokedex.dart';

class ProviderPokeApi {
  final String _urlBase = 'https://pokeapi.co/api/v2/';
  final String _allPokemon = 'pokemon/?offset=0&limit=1008';

  Future<List<Pokedex>> getPokedex() async {
    final String endpoint = '$_urlBase$_allPokemon';
    Response response = await get(Uri.parse(endpoint));
    final pokedex = pokedexFromJson(response.body);
    await Future.delayed(const Duration(seconds: 7));
    return pokedex.results;
  }

  Future<Pokemon> getPokemon(String url) async {
    Response response = await get(Uri.parse(url));
    final pokemon = pokemonFromJson(response.body);
    return pokemon;
  }
}
