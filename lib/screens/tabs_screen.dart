import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';
import '../models/meal.dart';
import '../widgets/banner.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  @override
  void initState() {
    _pages =
        [
          {
            'page': CategoriesScreen(),
            'title': 'Categories',
          },
          {
            'page': FavoritesScreen(widget.favoriteMeals),
            'title': 'Favorites',
          },
        ];
    super.initState();
  }

  

  int _selectPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return wrapWithBanner(
      Scaffold(
        appBar: AppBar(
          elevation: 7,
          title: Text(
            _pages[_selectPageIndex]['title'],
            //textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        drawer: MainDrawer(),
        body: _pages[_selectPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: _selectPageIndex,
          items: [
            BottomNavigationBarItem(
              
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              label: "Favorites",
            ),
          ],
        ),
      ),
    );
  }
}
