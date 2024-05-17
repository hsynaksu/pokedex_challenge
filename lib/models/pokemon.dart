import 'package:pokedex_challenge/models/pokemon_type.dart';
import 'package:pokedex_challenge/utils/extensions.dart';

class Pokemon {
  final int id;
  final String name;
  final List<PokemonType> types;
  final String defaultSpriteUrl;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.defaultSpriteUrl,
  });

  factory Pokemon.fromJson(Map<String, dynamic> data) {
    final id = data['id'] as int;
    final name = (data['name'] as String).capitalize();
    final typesList = data['types'] as List<dynamic>;
    final spriteList = data['sprites'] as List<dynamic>;
    final spriteUrl = spriteList[0]['sprites']['other']['official-artwork']['front_default'];

    return Pokemon(
      id: id,
      name: name,
      types: List<PokemonType>.from(
        typesList.map(
          (type) => PokemonType.fromJson(
            type['type'] as Map<String, dynamic>,
          ),
        ),
      ),
      // Some pokemon have no sprites
      defaultSpriteUrl: (spriteUrl ?? "") as String,
    );
  }
}
