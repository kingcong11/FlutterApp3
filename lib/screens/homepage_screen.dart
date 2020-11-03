import 'package:flutter/material.dart';

/* Widgets */
import '../widgets/homepage_heading.dart';
import '../widgets/meal_card.dart';

class MyHomePage extends StatelessWidget {
  /* Properties */
  static const routeName = '/home';
  final double availableContentSize;

  MyHomePage({this.availableContentSize});

  @override
  Widget build(BuildContext context) {
    final _availableContentSize = availableContentSize;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _availableContentSize * .15,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: HomepageHeading(),
            ),
            Container(
              height: _availableContentSize * .55,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: DefaultTabController(
                length: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: TabBar(
                        isScrollable: true,
                        indicator: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xFFf8b500), Color(0xFFffda7f)]),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        unselectedLabelStyle: TextStyle(fontSize: 15),
                        unselectedLabelColor: Color(0xFFb7b7b7),
                        tabs: [
                          Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('All Meals'),
                              ),
                            ),
                          ),
                          Tab(text: 'Popular'),
                          Tab(text: 'Pizza'),
                          Tab(text: 'Top'),
                          Tab(text: 'Food'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Container(
                            // color: Colors.orange,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: List.generate(3, (index) {
                                return MealCard(
                                  index: index,
                                );
                              }),
                            ),
                          ),
                          Container(child: Icon(Icons.star)),
                          Container(child: Icon(Icons.local_pizza)),
                          Container(child: Icon(Icons.food_bank)),
                          Container(child: Icon(Icons.restaurant)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // color: Colors.green[200],
            )
          ],
        ),
      ),
    );
  }
}
