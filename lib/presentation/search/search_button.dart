import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_challenge/presentation/search/search_page.dart';
import 'package:pokedex_challenge/providers/filter_handler.dart';

class SearchButton extends ConsumerWidget {
  final String searchedText;

  const SearchButton({super.key, required this.searchedText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchFilter = ref.watch(filterHandlerProvider).name;

    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SearchPage()),
        );
      },
      child: Ink(
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
              searchFilter ?? 'Search for a Pokemon',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
