import 'package:flutter/material.dart';
import 'package:lets_eat/screens/categories_screen.dart';
import 'package:lets_eat/screens/favorites_screen.dart';
import 'package:lets_eat/screens/homepage_screen.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  /* Properties */
  var _selectedPageIndex = 0;
  final double _btmNavBarSize = 57;

  /* Methods */
  void _selectPageIndex(int index) {
    setState(() => _selectedPageIndex = index);
  }

  /* Builders */
  Widget _appbarBuilder() {
    return AppBar(
      leading: Icon(
        Icons.menu,
        size: 30,
      ),
      title: Text('HappyTummy!'),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            size: 26,
          ),
          onPressed: () {},
        )
      ],
      elevation: 0,
      centerTitle: true,
    );
  }

  Widget _bottomNavBarBuilder() {
    return SizedBox(
      height: _btmNavBarSize,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 2
            )
          ]
        ),
        child: BottomNavigationBar(
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.view_day),
              label: 'Categories',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
          ],
          currentIndex: _selectedPageIndex,
          onTap: _selectPageIndex,
          selectedItemColor: Theme.of(context).accentColor,
          backgroundColor: Colors.grey[900],
        ),
      ),
    );
  }

  /* Getters */
  double _usedScaffoldContentSize(MediaQueryData _mediaQuery, AppBar appbar) {
    return (_mediaQuery.size.height -(appbar.preferredSize.height + _mediaQuery.padding.top + _btmNavBarSize));
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final _appbar = _appbarBuilder();
    final _bottomNavBar = _bottomNavBarBuilder();
    final _availableContentSize =
        _usedScaffoldContentSize(_mediaQuery, _appbar);

    final List<Map<String, Object>> _pages = [
      {'page': MyHomePage(availableContentSize: _availableContentSize), 'pageTitle': 'HappyTummy!'},
      {'page': CategoriesScreen(), 'pageTitle': 'Categories'},
      {'page': FavoritesScreen(availableContentSize: _availableContentSize),'pageTitle': 'Favorites'},
    ];

    return Scaffold(
      appBar: _appbar,
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: _bottomNavBar,
      backgroundColor: Colors.white,
    );
  }
}
