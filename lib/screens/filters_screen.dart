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
  var _filters = {
    'vegan': false,
    'vegetarian': false,
    'gluten': false,
    'lactose': false,
  };

  @override
  initState() {
    _filters['vegan'] = widget._currentFilters['vegan'];
    _filters['vegetarian'] = widget._currentFilters['vegetarian'];
    _filters['gluten'] = widget._currentFilters['gluten'];
    _filters['lactose'] = widget._currentFilters['lactose'];

    super.initState();
  }

  /* Builders */
  Widget _appbarBuilder() {
    return AppBar(
      title: Text('HappyTummy!'),
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
                        _filters['vegetarian'],
                        'Vegetarian',
                        (newValue) {
                          setState(() => _filters['vegetarian'] = newValue);
                          widget._saveFiltersCallbackHandler(_filters);
                        },
                      ),
                      _switchListTileBuilder(
                        _filters['gluten'],
                        'Gluten-Free',
                        (newValue) {
                          setState(() => _filters['gluten'] = newValue);
                          widget._saveFiltersCallbackHandler(_filters);
                        },
                      ),
                      _switchListTileBuilder(
                        _filters['lactose'],
                        'Lactose-Free',
                        (newValue) {
                          setState(() => _filters['lactose'] = newValue);
                          widget._saveFiltersCallbackHandler(_filters);
                        },
                      ),
                      _switchListTileBuilder(
                        _filters['vegan'],
                        'Vegan',
                        (newValue) {
                          setState(() => _filters['vegan'] = newValue);
                          widget._saveFiltersCallbackHandler(_filters);
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
