import 'package:pokedex_challenge/data/repoository/pokemon_repository.dart';
import 'package:pokedex_challenge/models/pokemon_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_pokemon_types.g.dart';

@Riverpod(keepAlive: true)
Future<List<PokemonType>> fetchPokemonTypes(FetchPokemonTypesRef ref) {
  final pokemonRepo = ref.watch(pokemonRepositoryProvider);

  return pokemonRepo.fetchPokemonTypes();
}
