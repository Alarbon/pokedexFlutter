// To parse this JSON data, do
//
//     final pokedex = pokedexFromJson(jsonString);

import 'dart:convert';

import 'pokedex_models.dart';

ResponsePokedex pokedexFromJson(String str) =>
    ResponsePokedex.fromJson(json.decode(str));

class ResponsePokedex {
  final List<Pokedex> results;

  ResponsePokedex({
    required this.results,
  });

  factory ResponsePokedex.fromJson(Map<String, dynamic> json) =>
      ResponsePokedex(
        results: List<Pokedex>.from(
            json["results"].map((x) => Pokedex.fromJson(x))),
      );
}

