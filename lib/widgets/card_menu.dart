import 'package:flutter/material.dart';
import 'package:restaurant_apps/model/menu.dart';
import 'package:restaurant_apps/theme.dart';

class CardMenu extends StatelessWidget {
  final Menu menu;

  const CardMenu({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: FadeInImage(
              width: 150,
              height: 80,
              fit: BoxFit.fitHeight,
              image: AssetImage(
                "assets/images/logo.png",
              ),
              placeholder: AssetImage(
                "assets/images/logo.png",
              ),
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                  height: 80,
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  menu.name,
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
