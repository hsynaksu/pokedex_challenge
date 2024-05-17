import 'package:flutter/material.dart';
import 'package:pokedex_challenge/models/pokemon_type.dart';

class ChipList extends StatelessWidget {
  final List<PokemonType> types;
  final Function(PokemonType) onPressed;

  const ChipList({super.key, required this.types, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Wrap(
        runSpacing: 16,
        spacing: 16,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: types
            .map(
              (type) => ActionChip(
                padding: const EdgeInsets.all(4),
                label: Text(type.name),
                labelStyle: Theme.of(context).textTheme.labelLarge,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () => onPressed(type),
              ),
            )
            .toList(),
      ),
    );
  }
}
