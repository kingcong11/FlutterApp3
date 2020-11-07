import 'package:flutter/material.dart';
import 'package:lets_eat/widgets/grid_meal_card.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  /* Properties */
  static const routeName = '/favorites';
  final double availableContentSize;
  final List<Meal> favorites;
  final Function toggleFavoriteCallbackHandler;
  final Function isMealFavorite;

  FavoritesScreen({this.availableContentSize, @required this.favorites, @required this.toggleFavoriteCallbackHandler, @required this.isMealFavorite});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: (favorites.isEmpty)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: availableContentSize * .2,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'You haven\'t added one yet, Let\'s add some recipes here. ',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: availableContentSize * .5,
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/images/empty.png',
                    fit: BoxFit.scaleDown,
                    filterQuality: FilterQuality.high,
                    isAntiAlias: true,
                  ),
                ),
              ],
            )
          : GridView.builder(
              itemCount: favorites.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 3 / 5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(15),
              itemBuilder: (_, index) {
                return Container(
                  child: GridMealCard(
                    id: favorites[index].id,
                    title: favorites[index].title,
                    description: favorites[index].description,
                    calories: favorites[index].calories,
                    price: favorites[index].price,
                    imageLocation: favorites[index].imageLocation,
                    toggleFavoriteCallbackHandler: toggleFavoriteCallbackHandler,
                    isMealFavorite: isMealFavorite,
                  ),
                );
              },
            ),
    );
  }
}
