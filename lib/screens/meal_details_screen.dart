import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

/* Widgets */
import '../widgets/bullet_list_item.dart';

import '../dummy-data/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  /* Properties */
  static const routeName = '/meal-details';
  final Function toggleFavoriteCallbackHandler;
  final Function isMealFavorite;

  MealDetailsScreen(this.toggleFavoriteCallbackHandler, this.isMealFavorite);

  /* Builder */
  Widget _appbarBuilder(BuildContext context, String mealId) {
    return AppBar(
      backgroundColor: Color(0xFF626465),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey[800].withOpacity(.4),
            child: Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.favorite,
                  size: 18,
                  color: isMealFavorite(mealId)
                      ? Theme.of(context).accentColor
                      : Colors.white,
                ),
                onPressed: () {
                  toggleFavoriteCallbackHandler(mealId);
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
                        isMealFavorite(mealId) ? 'Added to favorite meals.': 'Removed from favorite meals.',
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
                },
              ),
            ),
          ),
        )
      ],
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData().copyWith(
        color: Colors.white,
      ),
    );
  }

  List<Widget> _sectionBuilder(String title) {
    return [
      SizedBox(height: 20),
      Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
    ];
  }

  List<Widget> _gradientSectionBuilder(Gradient gradient, String title) {
    return [
      SizedBox(height: 20),
      GradientText(
        title,
        gradient: gradient,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
    ];
  }

  /* Getters */
  double _getRemainingContent(MediaQueryData _mediaQuery, AppBar appbar) {
    return (_mediaQuery.size.height -
        (appbar.preferredSize.height + _mediaQuery.padding.top));
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final mealDetails = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    final _mediaQuery = MediaQuery.of(context);
    final appbar = _appbarBuilder(context, mealId);
    final _availableContentSize = _getRemainingContent(_mediaQuery, appbar);

    Gradient myGradient = LinearGradient(
      colors: [Color(0xffDA44bb), Color(0xff8921aa)],
    );

    return Scaffold(
      appBar: appbar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: _availableContentSize * .5,
                    color: Colors.white,
                  ),
                  Container(
                    height: _availableContentSize * .42,
                    // decoration: BoxDecoration(color: Colors.grey[900]),
                    child: Image.asset(
                      'assets/images/grayscale.jpg',
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      isAntiAlias: true,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 15,
                    child: Container(
                      height: _availableContentSize * .18,
                      width: 300,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Container(
                              child: Text(
                                mealDetails.title,
                                // gradient: myGradient,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.9),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 35,
                    bottom: 1,
                    child: Container(
                      width: 200,
                      height: _availableContentSize * .3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.6),
                            offset: Offset(1, 2),
                            blurRadius: 1,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/foods/3.png',
                        isAntiAlias: true,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ..._gradientSectionBuilder(myGradient, 'Description'),
                    Text(
                      mealDetails.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[800],
                      ),
                    ),
                    ..._gradientSectionBuilder(myGradient, 'Ingredients'),
                    Column(
                      children: mealDetails.ingredients.map((ingredient) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 1.5),
                          child: BulletListItem(ingredient),
                        );
                      }).toList(),
                    ),
                    ..._gradientSectionBuilder(myGradient, 'Let\'s cook!'),
                    Column(
                      children: mealDetails.procedures.map((procedure) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 1.5),
                          child: BulletListItem(procedure),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
