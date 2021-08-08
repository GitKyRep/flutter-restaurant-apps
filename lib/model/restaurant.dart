class Restaurant {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late num rating;
  late List<dynamic> foods;
  late List<dynamic> drinks;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.foods,
    required this.drinks,
  });

  Restaurant.fromJson(Map<String, dynamic> restaurant) {
    id = restaurant['id'] ?? "";
    name = restaurant['name'] ?? "";
    description = restaurant['description'] ?? "";
    pictureId = restaurant['pictureId'] ?? "";
    city = restaurant['city'] ?? "";
    rating = restaurant['rating'];
    foods = restaurant['menus']["foods"];
    drinks = restaurant['menus']["drinks"];
  }
}
