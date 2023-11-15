// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

class Pokemon {
  final List<Ability> abilities;
  final int height;
  final int id;
  final List<Move> moves;
  final String name;
  final Species species;
  final Sprites sprites;
  final List<Type> types;
  final int weight;

  Pokemon({
    required this.abilities,
    required this.height,
    required this.id,
    required this.moves,
    required this.name,
    required this.species,
    required this.sprites,
    required this.types,
    required this.weight,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        abilities: List<Ability>.from(
            json["abilities"].map((x) => Ability.fromJson(x))),
        height: json["height"],
        id: json["id"],
        moves: List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
        name: json["name"],
        species: Species.fromJson(json["species"]),
        sprites: Sprites.fromJson(json["sprites"]),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        weight: json["weight"],
      );

  @override
  String toString() {
    return 'Pokemon {'
        ' abilities: ${abilities.map((a) => a.toString()).toList()},'
        ' height: $height,'
        ' id: $id,'
        ' moves: ${moves.map((m) => m.toString()).toList()},'
        ' name: $name,'
        ' species: $species,'
        ' sprites: $sprites,'
        ' types: ${types.map((t) => t.toString()).toList()},'
        ' weight: $weight'
        ' }';
  }
}

class Ability {
  final Species ability;
  final bool isHidden;
  final int slot;

  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );
}

class Species {
  final String name;
  final String url;

  Species({
    required this.name,
    required this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );
}

class Move {
  final Species move;

  Move({
    required this.move,
  });

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: Species.fromJson(json["move"]),
      );
}

class Sprites {
  final Other? other;

  Sprites({
    this.other,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        other: json["other"] == null ? null : Other.fromJson(json["other"]),
      );
}

class Other {
  final OfficialArtwork officialArtwork;

  Other({
    required this.officialArtwork,
  });

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
      );
}

class OfficialArtwork {
  final String frontDefault;
  final String frontShiny;

  OfficialArtwork({
    required this.frontDefault,
    required this.frontShiny,
  });

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );
}

class Type {
  final Species type;

  Type({
    required this.type,
  });
  factory Type.fromJson(Map<String, dynamic> json) => Type(
        type: Species.fromJson(json["type"]),
      );
}
