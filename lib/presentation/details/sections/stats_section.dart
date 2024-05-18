import 'package:flutter/material.dart';
import 'package:pokedex_challenge/models/pokemon_stat.dart';
import 'package:pokedex_challenge/presentation/details/sections/details_section.dart';

class StatsSection extends StatelessWidget {
  final List<PokemonStat> stats;

  const StatsSection({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return DetailsSection(
      title: "Stats",
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: stats
                .map(
                  (stat) => Text(
                    '${stat.name}:',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: stats
                .map(
                  (stat) => Text(
                    stat.value.toString(),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              children: stats
                  .map(
                    (stat) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: LinearProgressIndicator(
                        value: stat.value / 180,
                        minHeight: 8,
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
