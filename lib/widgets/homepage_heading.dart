import 'package:flutter/material.dart';

class HomepageHeading extends StatelessWidget {
  const HomepageHeading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Food',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
        const Text(
          'Special For You',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}