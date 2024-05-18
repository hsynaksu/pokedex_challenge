import 'package:flutter/material.dart';

class NoPokemonFound extends StatelessWidget {
  const NoPokemonFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text(
            "No Pokemon Found",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          const Text(
            "No Pokemon found with the given search criteria and filters. Please remove any filters or search for another term. Good luck!",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
