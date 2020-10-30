import 'dart:ui';
import 'package:flutter/material.dart';

/* Screens */
import 'screens/homepage_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        '/': (ctx) => MyHomePage(),
        CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
      },
    );
  }
}

