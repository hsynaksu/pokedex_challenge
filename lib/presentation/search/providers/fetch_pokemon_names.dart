import 'package:pokedex_challenge/data/repoository/pokemon_repository.dart';
import 'package:pokedex_challenge/presentation/search/providers/search_name_debouncer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_pokemon_names.g.dart';

@riverpod
Future<List<String>> fetchPokemonNames(FetchPokemonNamesRef ref) {
  final pokemonRepo = ref.watch(pokemonRepositoryProvider);
  final searchString = ref.watch(searchNameDebouncerProvider);

  if (searchString.isNotEmpty) {
    return pokemonRepo.fetchPokemonNames(searchString);
  }

  return Future.value([]);
}
