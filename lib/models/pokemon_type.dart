import 'package:pokedex_challenge/utils/extensions.dart';

class PokemonType {
  final int id;
  final String name;

  PokemonType({required this.id, required this.name});

  factory PokemonType.fromJson(Map<String, dynamic> data) {
    return PokemonType(
      id: data['id'] as int,
      name: (data['name'] as String).capitalize(),
    );
  }
}
