import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'grid_item.dart';

import '../../model/pokemon_list_item.dart';

class PokemonList extends StatelessWidget {
  final List<PokemonListItem> pokemonList;
  const PokemonList({super.key, required this.pokemonList});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      height: 532.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: GridView.builder(
          itemCount: pokemonList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.r,
            mainAxisSpacing: 8.r,
            mainAxisExtent: 100.h,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GridItem(pokemon: pokemonList[index]);
          }),
    );
  }
}
