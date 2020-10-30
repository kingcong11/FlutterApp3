import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(
        //   Icons.menu,
        //   size: 30,
        // ),
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
      ),
      body: Center(
        child: Text('Mga Pagkain'),
      ),
    );
  }
}
