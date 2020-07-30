import "package:flutter/material.dart";

const RoutesParent = const [
  RouteParent(
    iD: "GENERAL",
    parentName: "Icon",
    icon: Icons.sentiment_satisfied,
  ),
  RouteParent(
    iD: "PROFILE",
    parentName: "Profile",
    icon: Icons.person,
  ),
];

class RouteParent {
  final String iD;
  final String parentName;
  final IconData icon;

  const RouteParent({
    @required this.iD,
    @required this.parentName,
    this.icon,
  });
}
