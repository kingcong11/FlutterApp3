import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:lets_eat/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  /* Builders */

  Widget listileBuilder(String title, IconData icon, Function callbackHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: callbackHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.6),
                      spreadRadius: 1,
                      blurRadius: 3),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                'HappyTummy!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            listileBuilder('Meals', Icons.restaurant_menu_outlined,
                () => Navigator.of(context).pushReplacementNamed('/')),
            Divider(),
            listileBuilder('Filters', FeatherIcons.filter,
                () => Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName)),
            Divider(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 1),
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/cook.jpg',
                  isAntiAlias: true,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
