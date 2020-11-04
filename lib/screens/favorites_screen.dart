import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  /* Properties */
  static const routeName = '/favorites';
  final double availableContentSize;

  FavoritesScreen({this.availableContentSize});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.grey,
              width: double.infinity,
              height: availableContentSize * 1,
            ),
          ],
        ),
      ),
    );
  }
}
