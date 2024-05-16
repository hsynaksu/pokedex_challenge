import 'package:flutter/material.dart';
import 'package:pokedex_challenge/filter_modal.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      padding: const EdgeInsets.all(4),
      label: const Text("Type"),
      labelStyle: Theme.of(context).textTheme.labelLarge,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: () => showModalBottomSheet<void>(
        context: context,
        builder: (context) => const FilterModal(),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      ),
    );
  }
}
