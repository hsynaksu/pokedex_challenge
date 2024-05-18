import 'package:flutter/material.dart';
import 'package:pokedex_challenge/models/pokemon_type.dart';
import 'package:pokedex_challenge/presentation/details/sections/details_section.dart';

class TypeSection extends StatelessWidget {
  final List<PokemonType> types;
  const TypeSection({super.key, required this.types});

  @override
  Widget build(BuildContext context) {
    return DetailsSection(
      title: "Type",
      child: Row(
        children: types
            .map(
              (type) => Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Chip(
                  padding: const EdgeInsets.all(4),
                  label: Text(
                    type.name,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
