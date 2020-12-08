import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './data/dummy_data.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/filter_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];
  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) return false;
        if (_filters['lactose'] && !meal.isLactoseFree) return false;
        if (_filters['vegetarian'] && !meal.isVegetarian) return false;
        if (_filters['vegan'] && !meal.isVegan) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealID) {
    final existingIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealID);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealID));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals App',

      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
        canvasColor: Colors.black,
        fontFamily: 'Raleway',
        //pageTransitionsTheme: PageTransitionsTheme(builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder(),}),
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(color: Colors.black),
            bodyText2: TextStyle(color: Colors.white),
            headline6: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            ),
            headline5: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.normal,
            ),
            subtitle1: TextStyle(
              color: Colors.white,
              fontSize: 11.0,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.normal,
            )),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey.withOpacity(.7),
          labelStyle: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Theme.of(context).primaryColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(.6),
            elevation: 7,
            selectedLabelStyle: TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.normal,
              fontSize: 10,
            ),
            type: BottomNavigationBarType.shifting),
        accentColorBrightness: Brightness.dark,
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),

      //home: CategoriesScreen(),
      initialRoute: '/',
      /*For MaterialPageRoute */
      // routes: {
      //   '/': (ctx) => CategoriesScreen(),
      //   CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
      // },
      // ignore: missing_return

      /* For CupertinoPageRouter */

      // ignore: missing_return
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return CupertinoPageRoute(
                builder: (_) => TabsScreen(_favoriteMeal), settings: settings);
          case CategoryMealScreen.routeName:
            return CupertinoPageRoute(
                builder: (_) => CategoryMealScreen(_availableMeals),
                settings: settings);
          case MealDetailScreen.routeName:
            return CupertinoPageRoute(
                builder: (_) =>
                    MealDetailScreen(_toggleFavorite, _isMealFavorite),
                settings: settings);
          case FiltersScreen.routeName:
            return CupertinoPageRoute(
                builder: (_) => FiltersScreen(_filters, _setFilter),
                settings: settings);
        }
      },
      /* Fall Back Route  if no royte found More of a 404 route */
      onUnknownRoute: (settings) {
        return CupertinoPageRoute(
            builder: (_) => CategoriesScreen(), settings: settings);
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(child: Text('Navigation Screen')));
  }
}
