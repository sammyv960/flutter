import "package:flutter/material.dart";

import "../routes/routes.dart";
import "../routes/routesParent.dart";

class DrawerMain extends StatelessWidget {
  static const routes = Routes;
  static const routesParent = RoutesParent;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        // HEADER
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Text(
            "Menu",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),

        // HOMEPAGE ITEMS
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              MenuListTile(
                  title: "Dashboard",
                  icon: Icons.home,
                  route: "/",
                  tappable: true),
              Divider(),
            ],
          ),
        ),

        // MENU ITEMS
        Container(

          height: double.maxFinite,
          color: Colors.lightBlue,
          // child: ListView.builder(
          //   itemBuilder: (ctx, index) => Center(
          //     child: Flexible(
          //       child: Text("hi"),
          //     ),
          //   ),
          //   itemCount: routesParent.length,
          // ),
        ),

        // buildListTile(context, "Forms", Icons.input, "/"),
      ]),
    );
  }
}

class MenuListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool tappable;
  final String route;

  MenuListTile({
    @required this.title,
    this.icon,
    this.tappable = false,
    this.route,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon != null
            ? icon
            : Icon(
                Icons.mode_edit,
                color: Colors.transparent,
              ),
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          // fontWeight: FontWeight.bold,
        ),
      ),
      trailing: tappable ? Icon(Icons.keyboard_arrow_right) : null,
      onTap: tappable && route != null
          ? () {
              Navigator.of(context).pushReplacementNamed(route);
            }
          : null,
    );
  }
}
