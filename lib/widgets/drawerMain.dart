import "package:flutter/material.dart";

import "../routes/routes.dart";
import "../routes/routesParent.dart";

class DrawerMain extends StatelessWidget {
  static const routes = Routes;
  static const routesParent = RoutesParent;

  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context);

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
          // padding: EdgeInsets.symmetric(vertical: 10),
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
        Expanded(
          child: ListView.builder(
            itemBuilder: (ctx, index) => Column(children: [
              MenuListTile(
                title: routesParent[index].parentName,
                icon: routesParent[index].icon,
              ),
              Column(
                children: routes.where((route) {
                  return route.parentID.contains(routesParent[index].iD);
                }).map((route) {
                  return MenuListTile(
                    title: route.routeName,
                    icon: route.icon,
                    tappable: true,
                    route: route.route,
                  );
                }).toList(),
              )
            ]),
            itemCount: routesParent.length,
          ),
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
        icon != null ? icon : Icons.mode_edit,
        size: 26,
        color: icon != null ? Colors.blue.shade400 : Colors.transparent
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
