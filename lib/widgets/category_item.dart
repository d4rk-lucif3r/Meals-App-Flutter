import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(.3),
              color.withOpacity(.7),
              color,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
          ),
          // gradient: RadialGradient(
          //   center: Alignment.topLeft,
          //   colors: [
          //     color.withOpacity(.5),
          //     color.withOpacity(.7),
          //     color,
          //   ],
          //   radius: 15
          // ),
          // gradient: SweepGradient(
          //   center: Alignment.topLeft,
          //   colors: [
          //     color.withOpacity(.3),
          //     color.withOpacity(.7),
          //     color,
          //   ]
          // ),

          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
