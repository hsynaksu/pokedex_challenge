import 'package:flutter/material.dart';
import 'package:pokedex_challenge/presentation/filter/filter_button.dart';
import 'package:pokedex_challenge/presentation/list/pokemon_list.dart';
import 'package:pokedex_challenge/presentation/search/search_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchButton(searchedText: ''),
              SizedBox(height: 8),
              FilterButton(),
              SizedBox(height: 16),
              PokemonList(),
            ],
          ),
        ),
      ),
    );
  }
}
