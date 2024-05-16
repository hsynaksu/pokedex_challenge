import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final String searchedText;

  const SearchButton({super.key, required this.searchedText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            'Search for a Pokemon',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          )
        ],
      ),
    );
  }
}
