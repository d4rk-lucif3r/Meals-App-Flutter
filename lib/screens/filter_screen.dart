import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filter-screen';
  final Function saveFilters;
  final Map<String, bool> currentfilters;
  FiltersScreen(this.currentfilters, this.saveFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentfilters['gluten'];
    _lactoseFree = widget.currentfilters['lactose'];
    _vegetarian = widget.currentfilters['vegetarian'];
    _vegan = widget.currentfilters['vegan'];
    super.initState();
  }

  Widget _buildSwitcgListTile(String title, String subtitle,
      bool valueToBeFiltered, Function updateFunction) {
    return SwitchListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Text(title, style: Theme.of(context).textTheme.headline5),
      value: valueToBeFiltered,
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.subtitle1),
      onChanged: updateFunction,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.save),
        //     onPressed: () {
        //       final selectedFilters = {
        //         'gluten': _glutenFree,
        //         'lactose': _lactoseFree,
        //         'vegetarian': _vegetarian,
        //         'vegan': _vegan,
        //       };
        //       widget.saveFilters(selectedFilters);
        //     },
        //   )
        // ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitcgListTile('Gluten-Free',
                    'Only Include Gluten-free meals', _glutenFree, (newValue) {
                  setState(
                    () {
                      _glutenFree = newValue;
                      final selectedFilters = {
                        'gluten': _glutenFree,
                        'lactose': _lactoseFree,
                        'vegetarian': _vegetarian,
                        'vegan': _vegan,
                      };
                      widget.saveFilters(selectedFilters);
                    },
                  );
                }),
                _buildSwitcgListTile(
                  'Lactos-Free',
                  'Only Include Lactose-free meals',
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                      final selectedFilters = {
                        'gluten': _glutenFree,
                        'lactose': _lactoseFree,
                        'vegetarian': _vegetarian,
                        'vegan': _vegan,
                      };
                      widget.saveFilters(selectedFilters);
                    });
                  },
                ),
                _buildSwitcgListTile(
                  'Vegetarian',
                  'Only Include Vegetarian meals',
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                      final selectedFilters = {
                        'gluten': _glutenFree,
                        'lactose': _lactoseFree,
                        'vegetarian': _vegetarian,
                        'vegan': _vegan,
                      };
                      widget.saveFilters(selectedFilters);
                    });
                  },
                ),
                _buildSwitcgListTile(
                  'Vegan',
                  'Only Include Vegan meals',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                      final selectedFilters = {
                        'gluten': _glutenFree,
                        'lactose': _lactoseFree,
                        'vegetarian': _vegetarian,
                        'vegan': _vegan,
                      };
                      widget.saveFilters(selectedFilters);
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
