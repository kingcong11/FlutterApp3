import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import './homepage_screen.dart';
import '../widgets/main_drawer.dart';

/* Models */
import '../models/meal.dart';

/* Packages */
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

enum _SelectedTab { home, catergories, favorites, search }

class NavigationScreen extends StatefulWidget {

  final List<Meal> favorites;
  final Function toggleFavoriteCallbackHandler;
  final Function isMealFavorite;

  NavigationScreen(this.favorites, this.toggleFavoriteCallbackHandler, this.isMealFavorite);
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  /* Properties */
  final double _btmNavBarSize = 57;
  var _selectedTab = _SelectedTab.home;

  /* Methods */
  void _selectTabIndex(int index) {
    setState(() => _selectedTab = _SelectedTab.values[index]);
  }

  /* Builders */
  Widget _appbarBuilder() {
    return AppBar(
      title: Text('HappyTummy!'),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            size: 26,
          ),
          onPressed: () {
            var test = _remainingAvailableContent;
            print(test);
          },
        )
      ],
      elevation: 0,
      centerTitle: true,
    );
  }

  Widget _bottomNavBarBuilder() {
    return SizedBox(
      height: _btmNavBarSize,
      child: SalomonBottomBar(
        items: [
          SalomonBottomBarItem(
            icon: Icon(FeatherIcons.home),
            title: Text('Home'),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(FeatherIcons.grid),
            title: Text('Categories'),
            selectedColor: Colors.blue,
          ),
          SalomonBottomBarItem(
            icon: Icon(FeatherIcons.heart),
            title: Text('Favorite'),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(FeatherIcons.search),
            title: Text('Search'),
            selectedColor: Colors.orange,
          ),
        ],
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _selectTabIndex,

      ),
    );
  }

  /* Getters */
  double _remainingAvailableContent(MediaQueryData _mediaQuery, AppBar appbar) {
    return (_mediaQuery.size.height -
        (appbar.preferredSize.height +
            _mediaQuery.padding.top +
            _btmNavBarSize));
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final _appbar = _appbarBuilder();
    final _bottomNavBar = _bottomNavBarBuilder();
    final _availableContentSize = _remainingAvailableContent(_mediaQuery, _appbar);

    final List<Map<String, Object>> _pages = [
      {
        'page': MyHomePage(availableContentSize: _availableContentSize),
        'pageTitle': 'HappyTummy!'
      },
      {
        'page': CategoriesScreen(),
        'pageTitle': 'Categories',
      },
      {
        'page': FavoritesScreen(availableContentSize: _availableContentSize, favorites: widget.favorites, toggleFavoriteCallbackHandler: widget.toggleFavoriteCallbackHandler, isMealFavorite: widget.isMealFavorite,),
        'pageTitle': 'Favorites'
      },
      {'page': null, 'pageTitle': 'Search'}
    ];

    return Scaffold(
      appBar: _appbar,
      drawer: MainDrawer(),
      body: _pages[_SelectedTab.values.indexOf(_selectedTab)]['page'],
      bottomNavigationBar: _bottomNavBar,
      backgroundColor: Colors.white,
    );
  }
}
