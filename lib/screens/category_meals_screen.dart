import 'package:flutter/material.dart';

/* Modelds */
import '../models/meal.dart';

/* Widgets */
import '../widgets/grid_meal_card.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableFilteredMeals;

  CategoryMealsScreen(this.availableFilteredMeals);

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

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['categoryId'];
    final categoryName = routeArgs['categoryName'];

    final _mediaQuery = MediaQuery.of(context);
    final appbar = _appbarBuilder(categoryName);

    final filteredMealsByCategory = availableFilteredMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: appbar,
      body: SafeArea(
        child: GridView.builder(
          itemCount: filteredMealsByCategory.length,
          padding: const EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 3 / 5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemBuilder: (_, index) {
            return Container(
              child: GridMealCard(
                id: filteredMealsByCategory[index].id,
                title: filteredMealsByCategory[index].title,
                description: filteredMealsByCategory[index].description,
                calories: filteredMealsByCategory[index].calories,
                price: filteredMealsByCategory[index].price,
                imageLocation: filteredMealsByCategory[index].imageLocation,
              ),
            );
          },
        ),
      ),
    );
  }
}
