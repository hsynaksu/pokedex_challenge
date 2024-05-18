import 'package:flutter/material.dart';
import 'package:pokedex_challenge/models/pokemon_details.dart';
import 'package:pokedex_challenge/presentation/details/sections/details_section.dart';

class SpeciesSection extends StatelessWidget {
  final PokemonDetails details;
  const SpeciesSection({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return DetailsSection(
      title: "Species",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            details.flavorText,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            "Height: ${details.height * 10} cm  Weigth: ${details.weight / 10} kg",
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
