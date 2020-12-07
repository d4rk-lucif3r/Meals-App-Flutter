import 'package:flutter/material.dart';

import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildListTile(IconData icon, String title, Function tapHandler) {
      return ListTile(
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        tileColor: Theme.of(context).primaryColor,
        leading: Icon(icon, size: 25),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        onTap: () {
          tapHandler();
        },
      );
    }

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 130,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20),
          _buildListTile(Icons.restaurant, 'Meals', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          SizedBox(height: 10),
          _buildListTile(Icons.settings, 'Filters', () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
