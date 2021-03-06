import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  final int index;
  const MealCard({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> images = [
      {
        'path': 'assets/images/foods/1.png',
        'name': 'Classico',
        'description': 'Tossed Salad with Salmon',
        'price': 3.25
      },
      {
        'path': 'assets/images/foods/2.png',
        'name': 'Chicken Ala Dugs',
        'description': 'Spicy Chicken Wings',
        'price': 5.75
      },
      {
        'path': 'assets/images/foods/3.png',
        'name': 'Beef Steak',
        'description': 'Beef Steak with Mushroom gravy',
        'price': 6.99
      },
    ];

    return LayoutBuilder(builder: (_, constraints) {
      return Container(
        width: 190,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.symmetric(
              vertical: constraints.maxHeight * .025), //delete this later
          elevation: 1.5,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: constraints.maxHeight * .15,
                  decoration: BoxDecoration(
                    color: Color(0xFFE8E8E8),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
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
                      const Text(
                        '78 Calories',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 7, left: 7, right: 7),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.favorite,
                            color: Color(0xFFaaaaaa),
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    height: constraints.maxHeight * .55,
                    color: Color(0xFFE8E8E8),
                    padding: EdgeInsets.all(3),
                    child: Image.asset(
                      images[index]['path'],
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      filterQuality: FilterQuality.high,
                      isAntiAlias: true,
                    )),
                Container(
                  height: constraints.maxHeight * .25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 5,
                        fit: FlexFit.loose,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            images[index]['name'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
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
                            images[index]['description'],
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
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
