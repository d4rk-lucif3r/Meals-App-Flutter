import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
              bodyText1: TextStyle(color: Colors.blueGrey),
              bodyText2: TextStyle(color: Colors.green),
              headline6: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
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
              fontFamily: 'Raleway',
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
                builder: (_) => TabsScreen(), settings: settings);
          case CategoryMealScreen.routeName:
            return CupertinoPageRoute(
                builder: (_) => CategoryMealScreen(), settings: settings);
          case MealDetailScreen.routeName:
            return CupertinoPageRoute(
                builder: (_) => MealDetailScreen(), settings: settings);
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
