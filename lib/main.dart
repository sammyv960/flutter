import 'package:flutter/material.dart';

import 'screen/catalogueMain.dart';
import 'screen/mealMain.dart';
import 'screen/mealDetailsMain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: Catalogue(),
      initialRoute: "/",
      routes: {
        "/": (ctx) => Catalogue(),
        MealMain.routeName: (ctx) => MealMain(),
        MealDetailsMain.routeName: (ctx) => MealDetailsMain(),
      },
    );
  }
}
