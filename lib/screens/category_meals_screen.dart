import 'package:flutter/material.dart';
import '../dummy-data/dummy_data.dart';
import '../models/meal.dart';

/* Widgets */
import '../widgets/grid_meal_card.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryName;
  List<Meal> displayedMeals;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('initialization process');
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['categoryId'];
    categoryName = routeArgs['categoryName'];
    displayedMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
  }

  void _removeMeal(String mealId) {

    print('delete process');
    setState(() {
      displayedMeals.removeWhere((meal) {
        return meal.id == mealId;
      });
    });
  }

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

  @override
  Widget build(BuildContext context) {

    
    final appbar = _appbarBuilder(categoryName);

    return Scaffold(
      appBar: appbar,
      body: SafeArea(
        child: GridView.builder(
          itemCount: displayedMeals.length,
          padding: const EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 3 / 5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemBuilder: (_, index) {
            return Container(
              child: GridMealCard(
                id: displayedMeals[index].id,
                title: displayedMeals[index].title,
                description: displayedMeals[index].description,
                calories: displayedMeals[index].calories,
                price: displayedMeals[index].price,
                imageLocation: displayedMeals[index].imageLocation,
                removeItemHandler: _removeMeal,
              ),
            );
          },
        ),
      ),
    );
  }
}
