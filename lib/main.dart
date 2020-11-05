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

  /* Methods */

  void _setFilters(Map<String, bool> filterData) {
    setState(() {

      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['vegan']&& !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']&& !meal.isVegetarian) {
          return false;
        }
        if (_filters['gluten']&& !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']&& !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();

    });
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
        '/': (ctx) => NavigationScreen(),
        MyHomePage.routeName: (ctx) => MyHomePage(),
        FavoritesScreen.routeName: (ctx) => FavoritesScreen(),
        CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}