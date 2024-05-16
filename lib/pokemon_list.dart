import 'package:flutter/material.dart';
import 'package:pokedex_challenge/pokemon_tile.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 100,
        itemBuilder: (context, index) => PokemonTile(id: index + 1),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      ),
    );
  }
}
