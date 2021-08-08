import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_apps/model/restaurant.dart';
import 'package:restaurant_apps/pages/detail_page.dart';
import 'package:restaurant_apps/widgets/card_restaurant.dart';
import 'package:restaurant_apps/widgets/search_bar.dart';

import '../theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  String keyword = "";

  Future<bool> _onWillPop() async {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else {
      exit(0);
    }
    return false;
  }

  onSearchTextChanged(String text) async {
    setState(() {
      keyword = text.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: WillPopScope(
          onWillPop: _onWillPop,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBar(
                  controller: searchController,
                  onChanged: onSearchTextChanged,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: dimens,
                  ),
                  child: Text(
                    "Restaurant",
                    style: greyTextStyle.copyWith(fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: EdgeInsets.only(left: dimens),
                  child: Text(
                    "Mencari restoran yang murah meriah",
                    style: greyTextStyle.copyWith(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FutureBuilder<String>(
                  future: DefaultAssetBundle.of(context)
                      .loadString('assets/data_dummy/data-restaurant.json'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            'Data tidak tersedia',
                            style: blackTextStyle.copyWith(
                              fontSize: 20,
                            ),
                          ),
                        );
                      } else if (snapshot.hasData) {
                        final List<Restaurant> restaurants;
                        if (keyword == "") {
                          restaurants = parseJson(snapshot.data);
                        } else {
                          restaurants = parseJson(snapshot.data)
                              .where((data) =>
                                  data.name.toLowerCase().contains(keyword))
                              .toList();
                        }

                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: restaurants.length,
                          itemBuilder: (context, index) {
                            return CardRestaurant(
                              mRestaurant: restaurants[index],
                              onClickListener: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailPage(data: restaurants[index]),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: Text(
                            'Data tidak tersedia',
                            style: blackTextStyle.copyWith(
                              fontSize: 20,
                            ),
                          ),
                        );
                      }
                    } else {
                      return Center(
                        child: Text(
                          'State: ${snapshot.connectionState}',
                          style: blackTextStyle.copyWith(
                            fontSize: 20,
                          ),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
