import 'package:flutter/material.dart';
import '../widgets/banner.dart';

import '../data/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return wrapWithBanner( Scaffold(
        appBar: AppBar(
          title: const Text(
            "Meal App",
          ),
        ),
        body: GridView(
          padding: const EdgeInsets.all(20),
          children: DUMMY_CATEGORIES
              .map((catData) => CategoryItem(
                    catData.id,
                    catData.title,
                    catData.color,
                  ))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
        )));
  }
}
