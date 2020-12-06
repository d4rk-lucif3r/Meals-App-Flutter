import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
              )),

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
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return CupertinoPageRoute(
                builder: (_) => CategoriesScreen(), settings: settings);
          case CategoryMealScreen.routeName :
            return CupertinoPageRoute(
                builder: (_) => CategoryMealScreen(), settings: settings);
        }
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
