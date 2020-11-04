import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';

  /* Builders */
  Widget _appbarBuilder() {
    return AppBar(
      title: Text('HappyTumm!'),
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

  @override
  Widget build(BuildContext context) {

    final appbar = _appbarBuilder();
    return Scaffold(
      appBar: appbar,
      drawer: MainDrawer(),
      body: null,
    );
  }
}
