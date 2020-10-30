import 'package:flutter/material.dart';

class MyCategory {

  final String id;
  final String title;
  final String description;
  final Color  color;

  const MyCategory({
    @required this.id,
    @required this.title,
    this.description = '',
    this.color = Colors.orange,
  });

}