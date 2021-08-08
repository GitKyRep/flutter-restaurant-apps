import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurant_apps/model/menu.dart';
import 'package:restaurant_apps/model/restaurant.dart';
import 'package:restaurant_apps/theme.dart';
import 'package:restaurant_apps/widgets/card_menu.dart';

class DetailPage extends StatefulWidget {
  final Restaurant data;

  DetailPage({Key? key, required this.data}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    final List<Menu> foods = parseMenu(widget.data.foods);
    final List<Menu> drinks = parseMenu(widget.data.drinks);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Hero(
              tag: widget.data.name,
              child: FadeInImage(
                width: MediaQuery.of(context).size.width,
                height: 350,
                fit: BoxFit.cover,
                image: NetworkImage(widget.data.pictureId),
                placeholder:
                    AssetImage("assets/images/default-placeholder.png"),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/default-placeholder.png',
                  );
                },
              ),
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      //Note : Title
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: dimens,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                widget.data.name,
                                style: blackTextStyle.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            RatingBar.builder(
                              initialRating: widget.data.rating.toDouble(),
                              itemSize: 24.0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: dimens),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.pin_drop,
                              size: 16,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                widget.data.city,
                                style: regularTextStyle.copyWith(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: dimens),
                        child: Text(
                          "Deskripsi",
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: dimens),
                        child: Text(
                          widget.data.description,
                          style: regularTextStyle.copyWith(fontSize: 12),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // Note : Menu
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: dimens),
                        child: Text(
                          "Makanan",
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: dimens),
                        height: 120,
                        child: foods.isEmpty
                            ? Text(
                                "Tidak ada menu",
                                style: regularTextStyle.copyWith(
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              )
                            : ListView(
                                scrollDirection: Axis.horizontal,
                                children: foods.map((item) {
                                  return CardMenu(menu: item);
                                }).toList(),
                              ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      // Note : Menu
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: dimens),
                        child: Text(
                          "Minuman",
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: dimens),
                        height: 120,
                        child: drinks.isEmpty
                            ? Text(
                                "Tidak ada menu",
                                style: regularTextStyle.copyWith(
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              )
                            : ListView(
                                scrollDirection: Axis.horizontal,
                                children: drinks.map((item) {
                                  return CardMenu(menu: item);
                                }).toList(),
                              ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: secondaryColor,
                    child: IconButton(
                      color: blackColor,
                      icon: Icon(
                        Icons.arrow_back,
                        color: whiteColor,
                        size: 24,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: secondaryColor,
                    child: IconButton(
                      color: blackColor,
                      icon: isFav
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 24,
                            )
                          : Icon(
                              Icons.favorite_border,
                              color: whiteColor,
                              size: 24,
                            ),
                      onPressed: () {
                        setState(() {
                          isFav = !isFav;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
