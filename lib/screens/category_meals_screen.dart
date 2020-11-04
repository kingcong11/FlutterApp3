import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../dummy-data/dummy_data.dart';

/* Widgets */
import '../widgets/grid_meal_card.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  /* Builders */
  Widget _appbarBuilder(String categoryName) {
    return AppBar(
      title: Text(categoryName),
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

  /* Getters */
  // double _getRemainingContent(MediaQueryData _mediaQuery, AppBar appbar) {
  //   return (_mediaQuery.size.height -
  //       (appbar.preferredSize.height + _mediaQuery.padding.top));
  // }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['categoryId'];
    final categoryName = routeArgs['categoryName'];

    final _mediaQuery = MediaQuery.of(context);
    final appbar = _appbarBuilder(categoryName);
    // final _availableContentSize = _getRemainingContent(_mediaQuery, appbar);

    final filteredMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: appbar,
      body: SafeArea(
        child: GridView.builder(
          itemCount: filteredMeals.length,
          padding: const EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 3 / 5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemBuilder: (_, index) {
            return Container(
              child: GridMealCard(
                id: filteredMeals[index].id,
                title: filteredMeals[index].title,
                description: filteredMeals[index].description,
                calories: filteredMeals[index].calories,
                price: filteredMeals[index].price,
                imageLocation: filteredMeals[index].imageLocation,
              ),
            );
          },
        ),
      ),
    );
  }
}
