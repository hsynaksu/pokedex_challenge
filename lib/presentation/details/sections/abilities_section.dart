import 'package:flutter/material.dart';
import 'package:pokedex_challenge/presentation/details/sections/details_section.dart';

class AbilitiesSection extends StatelessWidget {
  final List<String> abilities;

  const AbilitiesSection({super.key, required this.abilities});

  @override
  Widget build(BuildContext context) {
    return DetailsSection(
      title: "Abilities",
      child: Row(
        children: abilities
            .map(
              (ability) => Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Chip(
                  padding: const EdgeInsets.all(4),
                  label: Text(
                    ability,
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
