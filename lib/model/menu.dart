class Menu {
  late String name;
  late String price;
  late String urlImageMenu;

  Menu({required this.name, required this.price, required this.urlImageMenu});

  Menu.fromJson(Map<String, dynamic> menu) {
    name = menu['name'] ?? "";
    price = menu['price'] ?? "";
    urlImageMenu = menu['urlImageMenu'] ?? "";
  }
}

List<Menu> parseMenu(List<dynamic> data) {
  List<dynamic> dataMenu = data;
  List<Menu> listMenu = [];
  for (int i = 0; i < dataMenu.length; i++)
    listMenu.add(Menu.fromJson(dataMenu[i]));
  return listMenu;
}
