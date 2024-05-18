import 'package:pokedex_challenge/data/repoository/pokemon_repository.dart';
import 'package:pokedex_challenge/models/pokemon_details.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_details.g.dart';

@riverpod
Future<PokemonDetails> fetchDetails(
  FetchDetailsRef ref, {
  required int id,
}) {
  final pokemonRepo = ref.watch(pokemonRepositoryProvider);

  return pokemonRepo.fetchPokemonDetails(id);
}
