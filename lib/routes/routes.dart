import "package:flutter/material.dart";

const Routes = const [
  Route(
    iD: "ICON",
    route: "/icon",
    routeName: "Icon",
    icon: Icons.lightbulb_outline,
    parentID: "GENERAL",
  ),
  Route(
    iD: "NAVIGATIONS",
    route: "/navigations",
    routeName: "Tabs, Navigations",
    parentID: "GENERAL",
  ),
  Route(
    iD: "PROFILE",
    route: "/profile",
    routeName: "Profile",
    icon: Icons.person,
    parentID: "PROFILE",
  ),
];

class Route {
  final String iD;
  final String route;
  final String routeName;
  final IconData icon;
  final String parentID;

  const Route({
    @required this.iD,
    @required this.route,
    @required this.routeName,
    this.icon,
    this.parentID,
  });
}
