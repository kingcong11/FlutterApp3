import 'package:flutter/material.dart';

class BulletListItem extends StatelessWidget {
  final String ingredient;

  BulletListItem(this.ingredient);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(top:4.5),
          child: Icon(Icons.lens, size: 8, color: Colors.black54),
        ),
        SizedBox(width: 6),
        Flexible(
          child: Container(
            child: Text(
              ingredient,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
          ),
        )
      ],
    );
  }
}
