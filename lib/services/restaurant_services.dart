import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;
import 'package:restaurant_apps/model/restaurant.dart';

class RestaurantServices {
  Future<List<Restaurant>> readJsonData() async {
    //read json file
    final jsondata = await rootBundle.rootBundle
        .loadString('assets/data_dummy/data-restaurant.json');
    //decode json data as list
    final list = json.decode(jsondata)["restaurants"] as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => Restaurant.fromJson(e)).toList();
  }
}
