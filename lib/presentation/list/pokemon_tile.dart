import 'package:flutter/material.dart';
import 'package:pokedex_challenge/models/pokemon.dart';

class PokemonTile extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonTile({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final idStyle = pokemon.id > 9999 ? textTheme.labelSmall : textTheme.titleMedium;

    return Container(
      height: 80,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              pokemon.id.toString(),
              style: idStyle?.copyWith(
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                pokemon.name,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              const SizedBox(height: 4),
              Row(
                children: pokemon.types
                    .map(
                      (type) => Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Chip(
                          padding: const EdgeInsets.all(4),
                          label: Text(
                            type.name,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    )
                    .toList(),
              )
            ],
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: const BorderRadiusDirectional.horizontal(
              end: Radius.circular(12),
            ),
            child: FadeInImage.assetNetwork(
              image: pokemon.defaultSpriteUrl,
              placeholder: "assets/placeholder.jpg",
              fit: BoxFit.contain,
              imageErrorBuilder: (context, error, stackTrace) => Image.asset('assets/placeholder.jpg'),
              width: 80,
              height: 80,
            ),
          ),
        ],
      ),
    );
  }
}
