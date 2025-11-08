import 'package:donut_app_ui/utils/util.dart';
import 'package:flutter/material.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.trip_origin),
            color: Utils.mainColor,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite),
            color: Utils.mainColor,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
            color: Utils.mainColor,
          ),
        ],
      ),
    );
  }
}
