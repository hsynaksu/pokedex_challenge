import 'package:flutter/material.dart';

class FilterModal extends StatelessWidget {
  const FilterModal({super.key});

  final typesList = const [
    "normal",
    "fighting",
    "flying",
    "poison",
    "ground",
    "rock",
    "bug",
    "ghost",
    "steel",
    "fire",
    "water",
    "grass",
    "electric",
    "psychic",
    "ice",
    "dragon",
    "dark",
    "fairy",
    "stellar",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Type',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Wrap(
              runSpacing: 16,
              spacing: 16,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: typesList
                  .map((type) => ActionChip(
                        padding: const EdgeInsets.all(4),
                        label: Text("${type[0].toUpperCase()}${type.substring(1).toLowerCase()}"),
                        labelStyle: Theme.of(context).textTheme.labelLarge,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: () => {},
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
