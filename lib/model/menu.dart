class Menu {
  late String name;

  Menu({required this.name});

  Menu.fromJson(Map<String, dynamic> menu) {
    name = menu['name'] ?? "";
  }
}

List<Menu> parseMenu(List<dynamic> data) {
  List<dynamic> dataMenu = data;
  List<Menu> listMenu = [];
  for (int i = 0; i < dataMenu.length; i++)
    listMenu.add(Menu.fromJson(dataMenu[i]));
  return listMenu;
}
