import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const grey = Color(0xFF283141);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: grey,
            unselectedItemColor: Color(0xFF8D9DB9),
            backgroundColor: Colors.white,
          )),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFFFFCC00),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        icon: Icon(
          Icons.auto_awesome,
          color: grey,
        ),
        label: Text(
          "Random",
          style: TextStyle(color: grey),
        ),
        onPressed: () {
          print("Random button pressed!");
        },
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows), label: "Compare"),
        BottomNavigationBarItem(icon: Icon(Icons.quiz), label: "Quiz"),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border), label: "Favorite"),
      ]),
      body: Column(children: [
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 76, left: 24, right: 24),
            child: Text("Pokédex")),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
              "Use the advanced search to find Pokémon by type, weakness, ability and more!"),
        )
      ]),
    );
  }
}
