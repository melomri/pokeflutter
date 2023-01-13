import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/search_bar.dart';
import '../model/pokemon_list_item.dart';
import '../utils/palette.dart';
import 'widgets/pokemon_list.dart';
import 'widgets/random_floating_button.dart';
import 'widgets/bottom_nav_bar.dart';
import 'widgets/styled_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<PokemonListItem> pokemonList = [];

  @override
  void initState() {
    readJsonFile();
    super.initState();
  }

  void readJsonFile() async {
    final jsonFile = await rootBundle.loadString("assets/pokemonList.json");
    final decoded = jsonDecode(jsonFile);
    for (var item in decoded["pokemonList"]) {
      final pokemonListItem =
          PokemonListItem(name: item["name"], url: item["url"]);
      pokemonList.add(pokemonListItem);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      floatingActionButton: const RandomFloatingButton(),
      bottomNavigationBar: const BottomNavBar(),
      body: Column(children: [
        Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 76, left: 24, right: 24),
            child: StyledText(
              text: "Pokédex",
              style: textTheme.displaySmall!,
              textHeight: 44,
            )),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Use the advanced search to find Pokémon by type, weakness, ability and more!",
            style: textTheme.bodyLarge
                ?.copyWith(color: gray[400], height: 24 / 16),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        SearchBar(),
        SizedBox(
          height: 24,
        ),
        PokemonList(
          pokemonList: pokemonList,
        ),
      ]),
    );
  }
}
