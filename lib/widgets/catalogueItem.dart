import "package:flutter/material.dart";

import '../screen/mealMain.dart';

class CatalogueItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CatalogueItem(this.id, this.title, this.color);

  void handleCatalogue(BuildContext ctx) {
    // Navigate with named routes
    Navigator.of(ctx).pushNamed(MealMain.routeName, arguments: {
      "id": id,
      "title": title,
    });

    // Navigate with pushing page widgets
    // Navigator.of(ctx).push(
    //   // push = push it on top of the page (visible), pop = pop it off the top of the page (invisible)
    //   MaterialPageRoute(builder: (_) {
    //     return MealMain(id, title);
    //   }),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // allow more interaction
      onTap: () => handleCatalogue(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.5),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
