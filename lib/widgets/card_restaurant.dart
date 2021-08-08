import 'package:flutter/material.dart';
import 'package:restaurant_apps/model/restaurant.dart';
import 'package:restaurant_apps/theme.dart';

class CardRestaurant extends StatelessWidget {
  final Restaurant mRestaurant;
  final VoidCallback onClickListener;

  const CardRestaurant(
      {Key? key, required this.mRestaurant, required this.onClickListener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClickListener,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 120,
                    height: 100,
                    child: Hero(
                      tag: mRestaurant.name,
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(mRestaurant.urlImage),
                        placeholder:
                            AssetImage("assets/images/default-placeholder.png"),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/default-placeholder.png',
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mRestaurant.name,
                    textAlign: TextAlign.left,
                    style: blackTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.pin_drop,
                        color: Colors.red,
                        size: 16.0,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          mRestaurant.location,
                          style: greyTextStyle.copyWith(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 16.0,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${mRestaurant.rating} / 5",
                        style: greyTextStyle.copyWith(fontSize: 12),
                      ),
                    ],
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
