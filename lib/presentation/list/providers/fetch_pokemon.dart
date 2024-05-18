import 'package:pokedex_challenge/data/repoository/pokemon_repository.dart';
import 'package:pokedex_challenge/models/pokemon_filter.dart';
import 'package:pokedex_challenge/models/pokemon_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_pokemon.g.dart';

@Riverpod(keepAlive: true)
Future<PokemonResponse> fetchPokemon(
  FetchPokemonRef ref, {
  required int limit,
  required int offset,
  PokemonFilter? filter,
}) {
  final pokemonRepo = ref.watch(pokemonRepositoryProvider);

  return pokemonRepo.fetchPokemon(
    limit: limit,
    offset: offset,
    filter: filter,
  );
}
