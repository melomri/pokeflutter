import 'package:flutter/material.dart';
import '../../model/pokemon_list_item.dart';

class PokemonList extends StatelessWidget {
  final List<PokemonListItem> pokemonList;
  const PokemonList({super.key, required this.pokemonList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 532,
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
          itemCount: pokemonList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            mainAxisExtent: 100,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text(pokemonList[index].name));
          }),
    );
  }
}
