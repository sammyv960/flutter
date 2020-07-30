import "package:flutter/material.dart";

import "../widgets/mealItem.dart";
import '../data/dummy_data.dart';

class MealMain extends StatelessWidget {
  static const routeName = 'categoriesInfo';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final mealArr = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(routeArgs['id']);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: mealArr[index].id,
              title: mealArr[index].title,
              imageUrl: mealArr[index].imageUrl,
              duration: mealArr[index].duration,
              complexity: mealArr[index].complexity,
              affordability: mealArr[index].affordability,
            );
          },
          itemCount: mealArr.length,
        ),
      ),
    );
  }
}
