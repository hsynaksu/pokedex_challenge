import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_challenge/presentation/list/no_pokemon_found.dart';
import 'package:pokedex_challenge/presentation/list/pokemon_tile.dart';
import 'package:pokedex_challenge/presentation/list/providers/fetch_pokemon.dart';
import 'package:pokedex_challenge/providers/filter_handler.dart';

class PokemonList extends ConsumerWidget {
  const PokemonList({super.key});

  static const pageSize = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(filterHandlerProvider);

    final firstPage = ref.watch(fetchPokemonProvider(
      limit: pageSize,
      offset: 0,
      filter: filter,
    ));

    final totalPokemon = firstPage.valueOrNull?.totalPokemon;

    return totalPokemon != null && totalPokemon == 0
        ? const NoPokemonFound()
        : Expanded(
            child: ListView.builder(
              key: ValueKey(filter),
              itemCount: totalPokemon,
              itemBuilder: (context, index) {
                final page = index ~/ pageSize + 1;
                final indexInPage = index % pageSize;

                final result = ref.watch(fetchPokemonProvider(
                  limit: pageSize,
                  offset: (page - 1) * pageSize,
                  filter: filter,
                ));

                return result.when(
                  data: (data) => PokemonTile(
                    pokemon: data.pokemonList[indexInPage],
                  ),
                  error: (err, stTrace) => Text(err.toString()),
                  loading: () => indexInPage == 0 ? const LinearProgressIndicator() : null,
                );
              },
            ),
          );
  }
}
