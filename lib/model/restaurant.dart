import 'dart:convert';

class Restaurant {
  late String name;
  late String location;
  late String rating;
  late String description;
  late String urlImage;
  late List<dynamic> menus;

  Restaurant(
      {required this.name,
      required this.location,
      required this.rating,
      required this.description,
      required this.urlImage,
      required this.menus});

  Restaurant.fromJson(Map<String, dynamic> restaurant) {
    name = restaurant['name'] ?? "";
    location = restaurant['location'];
    description = restaurant['description'];
    rating = restaurant['rating'];
    urlImage = restaurant['urlImage'];
    menus = restaurant['menu'];
  }
}

List<Restaurant> parseJson(String? json) {
  if (json == null) {
    return [];
  }
  final List parsed = jsonDecode(json);
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}
