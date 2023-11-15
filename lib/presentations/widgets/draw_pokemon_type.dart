import 'package:flutter/material.dart';

import 'info_pokemon_widget.dart';

class DrawType extends StatelessWidget {
  const DrawType({
    super.key,
    required this.widget,
    required this.posType,
  });

  final InfoPokemon widget;
  final int posType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.screenWidth * 0.22,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: getColorForType(widget.pokemon.types[posType].type.name),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Text(
          widget.pokemon.types[posType].type.name.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Color getColorForType(String type) {
    switch (type) {
      case 'normal':
        return const Color(
            0xFFA8A77A); // Puedes ajustar los códigos de color según tus preferencias
      case 'fire':
        return const Color(0xFFEE8130);
      case 'water':
        return const Color(0xFF6390F0);
      case 'electric':
        return const Color(0xFFF7D02C);
      case 'grass':
        return const Color(0xFF7AC74C);
      case 'ice':
        return const Color(0xFF96D9D6);
      case 'fighting':
        return const Color(0xFFC22E28);
      case 'poison':
        return const Color(0xFFA33EA1);
      case 'ground':
        return const Color(0xFFE2BF65);
      case 'flying':
        return const Color(0xFFA98FF3);
      case 'psychic':
        return const Color(0xFFF95587);
      case 'bug':
        return const Color(0xFFA6B91A);
      case 'rock':
        return const Color(0xFFB6A136);
      case 'ghost':
        return const Color(0xFF735797);
      case 'dark':
        return const Color(0xFF705746);
      case 'steel':
        return const Color(0xFFB7B7CE);
      case 'fairy':
        return const Color(0xFFD685AD);
      // Puedes agregar más casos según los tipos de Pokémon que necesites
      default:
        return Colors.blue; // Color predeterminado para tipos no especificados
    }
  }
}
