import 'dart:html';

class Pokemon {
  final String id;
  final String name;
  final String urlSprite;
  final String urlImage;
  final int weight;
  final int height;
  final List<String> typesList;

  Pokemon({
    required this.id,
    required this.name,
    required this.urlSprite,
    required this.urlImage,
    required this.weight,
    required this.height,
    required this.typesList,
  });

  Pokemon.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        urlSprite = json["sprites"]["front_default"],
        urlImage =
            json["sprites"]["other"]["official-artwork"]["front_default"],
        name = json["species"]["name"],
        weight = json["weight"].toDouble() / 10.0,
        height = json["height"].toDouble() * 10.0,
        typesList = getListTypesFromJson(json["types"]);
}

List<String> getListTypesFromJson(List<dynamic> json) {
  final List<String> typesList = [];
  for (var element in json) {
    typesList.add(element["type"]["name"]);
  }
  return typesList;
}
