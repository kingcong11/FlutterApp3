import 'dart:ui';
import 'package:flutter/material.dart';

import './dummy-data/dummy_data.dart';

/* Screens */
import './screens/navigation_screen.dart';
import './screens/homepage_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/favorites_screen.dart';
import './screens/filters_screen.dart';

/* Models */
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /* Properties */
  Map<String, bool> _filters = {
    'vegan': false,
    'vegetarian': false,
    'gluten': false,
    'lactose': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _myFavorites = [];

  /* Methods */
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    // indexWhere returns the index of the element if the condition is met, and return -1 if it doesn't found anything that satisfies the condition
    final fetchedIndex = _myFavorites.indexWhere((meal) => meal.id == mealId);

    if (fetchedIndex >= 0) {
      setState(() {
        _myFavorites.removeAt(fetchedIndex);
      });
    } else {
      setState(() {
        _myFavorites.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _myFavorites.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HappyTummy',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFFffffff),
        accentColor: Color(0xFFffda7f),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  // fontWeight: FontWeight.bold,
                ),
              ),
        ),
        fontFamily: 'Gilroy',
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => NavigationScreen(_myFavorites, _toggleFavorite, _isMealFavorite),
        MyHomePage.routeName: (ctx) => MyHomePage(),
        CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals, _toggleFavorite, _isMealFavorite),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
