import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';


/* Widgets */
import './widgets/homepage_heading.dart';
import './widgets/meal_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HappyTummy',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFFffffff),
        accentColor: Color(0xFFffda7f),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  // fontWeight: FontWeight.bold,
                ),
              ),
        ),
        fontFamily: 'Gilroy',
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _appbarBuilder() {
    return AppBar(
      leading: Icon(
        Icons.menu,
        size: 30,
      ),
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
    );
  }

  /* Getters */

  double _getRemainingContent(MediaQueryData _mediaQuery, AppBar appbar) {
    return (_mediaQuery.size.height -
        (appbar.preferredSize.height + _mediaQuery.padding.top));
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final appbar = _appbarBuilder();
    final _availableContentSize = _getRemainingContent(_mediaQuery, appbar);

    return Scaffold(
      appBar: appbar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _availableContentSize * .15,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                child: HomepageHeading(),
                // color: Colors.blue[300],
              ),
              Container(
                height: _availableContentSize * .65,
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
                                  return MealCard(index: index,);
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
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
      backgroundColor: Colors.white,
    );
  }
}
