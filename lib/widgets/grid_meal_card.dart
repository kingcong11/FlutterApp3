import 'package:flutter/material.dart';

/* Screens */
import '../screens/meal_details_screen.dart';

class GridMealCard extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final int calories;
  final double price;
  final String imageLocation;
  final Function toggleFavoriteCallbackHandler;
  final Function isMealFavorite;

  GridMealCard({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.calories,
    @required this.price,
    @required this.imageLocation,
    @required this.toggleFavoriteCallbackHandler,
    @required this.isMealFavorite,
  });

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailsScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(0),
        elevation: 1.5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: constraints.maxHeight * .15,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(7),
                      child: Image.asset(
                        'assets/images/png/fire.png',
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                        height: 20,
                      ),
                    ),
                    Text(
                      '$calories Calories',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 7, left: 7),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              size: 20,
                            ),
                            color: isMealFavorite(id)
                                ? Theme.of(context).accentColor
                                : Color(0xFFaaaaaa),
                            onPressed: () {
                              toggleFavoriteCallbackHandler(id);
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Container(
                                  height: 40,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    isMealFavorite(id)
                                        ? 'Added to favorite meals.'
                                        : 'Removed from favorite meals.',
                                    style: TextStyle(
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                backgroundColor: Colors.transparent,
                                duration: Duration(milliseconds: 2300),
                                elevation: 0,
                                padding: EdgeInsets.symmetric(horizontal: 15),
                              ));
                            }),
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () => selectMeal(context),
                child: Container(
                  height: constraints.maxHeight * .55,
                  child: Image.network(
                    imageLocation,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                onTap: () => selectMeal(context),
                child: Container(
                  height: constraints.maxHeight * .3,
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 5,
                        fit: FlexFit.loose,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 5,
                        fit: FlexFit.loose,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            description,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
