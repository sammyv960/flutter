import 'package:flutter/material.dart';

import '../widgets/drawerMain.dart';

class GeneralMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("General Page"),
      ),
      drawer: DrawerMain(),
      body: Center(
        child: Text("General Page"),
      ),
    );
  }
}
