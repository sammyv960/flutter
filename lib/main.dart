import 'package:flutter/material.dart';

import 'widgets/drawerMain.dart';
import './screens/generalMain.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo', // display for android in recent app, ios not used.
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      routes: {
        "/general": (ctx) => GeneralMain()
      }
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      drawer: DrawerMain(),
      body: Center(
        child: Text("Homepage"),
      ),
    );
  }
}
