import 'package:flutter/material.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

class Meal {
  final String id;
  final String title;
  final String description;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> procedures;
  final Complexity complexity;
  final String imageLocation;
  final bool isVegan;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final int calories;
  final double price;

  const Meal({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.categories,
    @required this.ingredients,
    @required this.procedures,
    @required this.complexity,
    @required this.imageLocation,
    @required this.calories,
    @required this.price,
    this.isVegan = false,
    this.isGlutenFree = false,
    this.isLactoseFree = false,
  });
}
