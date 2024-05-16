import 'package:flutter/material.dart';

class PokemonTile extends StatelessWidget {
  final int id;

  const PokemonTile({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
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
              id.toString(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.surface,
                  ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Balbasaur",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Chip(
                    padding: EdgeInsets.all(4),
                    label: Text(
                      "Grass",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  const SizedBox(width: 4),
                  Chip(
                    padding: EdgeInsets.all(4),
                    label: Text(
                      "Poison",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: const BorderRadiusDirectional.horizontal(
              end: Radius.circular(12),
            ),
            child: FadeInImage(
              image: NetworkImage(
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png"),
              placeholder: const AssetImage('assets/placeholder.jpg'),
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
