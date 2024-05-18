import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_challenge/models/pokemon.dart';
import 'package:pokedex_challenge/presentation/details/providers/fetch_details.dart';
import 'package:pokedex_challenge/presentation/details/sections/abilities_section.dart';
import 'package:pokedex_challenge/presentation/details/sections/species_section.dart';
import 'package:pokedex_challenge/presentation/details/sections/stats_section.dart';
import 'package:pokedex_challenge/presentation/details/sections/type_section.dart';

class DetailsPage extends ConsumerWidget {
  final Pokemon pokemon;
  const DetailsPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(fetchDetailsProvider(id: pokemon.id));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('${pokemon.name} #${pokemon.id}'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.network(
                    pokemon.defaultSpriteUrl,
                    width: 200,
                    height: 200,
                  ),
                ),
                TypeSection(types: pokemon.types),
                ...details.when(
                  data: (data) => [
                    SpeciesSection(details: data),
                    AbilitiesSection(abilities: data.abilities),
                    StatsSection(stats: data.stats),
                  ],
                  error: (error, stackTrace) => [Text(error.toString())],
                  loading: () => [const LinearProgressIndicator()],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
