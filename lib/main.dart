import 'package:flutter/material.dart';
import 'package:restaurant_apps/pages/splash_page.dart';
import 'package:restaurant_apps/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: secondaryColor,
      ),
      home: SplashPage(),
    );
  }
}
