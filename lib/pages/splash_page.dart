import 'package:flutter/material.dart';
import 'package:restaurant_apps/pages/home_page.dart';

import '../theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("assets/images/splash_image.png"),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 50,
                left: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/logo.png",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Temukan Restoran\nFavorite Kalian",
                    style: blackTextStyle.copyWith(
                      fontSize: 29,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Cari tempat makan yang nyaman, bersih\ndan memberikan harga yang terjangkau",
                    style: regularTextStyle,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 50,
                    width: 210,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Lets Go",
                            style: regularTextStyle.copyWith(
                              fontSize: 22,
                              color: whiteColor,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: whiteColor,
                            size: 24.0,
                          )
                        ],
                      ),
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
