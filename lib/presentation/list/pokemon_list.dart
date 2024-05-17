import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_challenge/presentation/list/pokemon_tile.dart';
import 'package:pokedex_challenge/providers/fetch_pokemon.dart';
import 'package:pokedex_challenge/providers/type_filter_notifier.dart';

class PokemonList extends ConsumerWidget {
  const PokemonList({super.key});

  static const pageSize = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typeInfo = ref.watch(typeFilterProvider);

    final firstPage = ref.watch(fetchPokemonProvider(limit: pageSize, offset: 0, typeFilter: typeInfo));
    final totalPokemon = firstPage.valueOrNull?.totalPokemon;

    return Expanded(
      child: ListView.builder(
        key: ValueKey(typeInfo),
        itemCount: totalPokemon,
        itemBuilder: (context, index) {
          final page = index ~/ pageSize + 1;
          final indexInPage = index % pageSize;

          final result = ref.watch(fetchPokemonProvider(
            limit: pageSize,
            offset: (page - 1) * pageSize,
            typeFilter: typeInfo,
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
