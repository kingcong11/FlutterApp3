import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function _saveFiltersCallbackHandler;
  final Map<String, bool> _currentFilters;

  FiltersScreen(this._currentFilters, this._saveFiltersCallbackHandler);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  /* Properties */
  var _vegan = false;
  var _vegetarian = false;
  var _glutenFree = false;
  var _lactoseFree = false;

  @override
  initState() {
    _vegan =  widget._currentFilters['vegan'];
    _vegetarian = widget._currentFilters['vegetarian'];
    _glutenFree = widget._currentFilters['gluten'];
    _lactoseFree = widget._currentFilters['lactose'];
    super.initState();
  }

  /* Builders */
  Widget _appbarBuilder() {
    return AppBar(
      title: Text('HappyTumm!'),
      actions: [
        IconButton(
          icon: Icon(
            FeatherIcons.save,
            size: 26,
          ),
          onPressed: () {},
        )
      ],
      elevation: 0,
      centerTitle: true,
    );
  }

  Widget _switchListTileBuilder(
    bool currentValue,
    String title,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('Only include ${title.toLowerCase()} meals.'),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    final appbar = _appbarBuilder();
    return Scaffold(
      appBar: appbar,
      drawer: MainDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            'Filter Settings',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Adjust your meal selection based on your own prefferences.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      _switchListTileBuilder(
                        _vegetarian,
                        'Vegetarian',
                        (newValue) {
                          setState(() => _vegetarian = newValue);
                          final Map<String, bool> selectedFilter = {
                            'vegan': _vegan,
                            'vegetarian': _vegetarian,
                            'gluten': _glutenFree,
                            'lactose': _lactoseFree,
                          };
                          widget._saveFiltersCallbackHandler(selectedFilter);
                        },
                      ),
                      _switchListTileBuilder(
                        _glutenFree,
                        'Gluten-Free',
                        (newValue) {
                          setState(() => _glutenFree = newValue);
                          final Map<String, bool> selectedFilter = {
                            'vegan': _vegan,
                            'vegetarian': _vegetarian,
                            'gluten': _glutenFree,
                            'lactose': _lactoseFree,
                          };
                          widget._saveFiltersCallbackHandler(selectedFilter);
                        },
                      ),
                      _switchListTileBuilder(
                        _lactoseFree,
                        'Lactose-Free',
                        (newValue) {
                          setState(() => _lactoseFree = newValue);
                          final Map<String, bool> selectedFilter = {
                            'vegan': _vegan,
                            'vegetarian': _vegetarian,
                            'gluten': _glutenFree,
                            'lactose': _lactoseFree,
                          };
                          widget._saveFiltersCallbackHandler(selectedFilter);
                        },
                      ),
                      _switchListTileBuilder(
                        _vegan,
                        'Vegan',
                        (newValue) {
                          setState(() => _vegan = newValue);
                          final Map<String, bool> selectedFilter = {
                            'vegan': _vegan,
                            'vegetarian': _vegetarian,
                            'gluten': _glutenFree,
                            'lactose': _lactoseFree,
                          };
                          widget._saveFiltersCallbackHandler(selectedFilter);
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
