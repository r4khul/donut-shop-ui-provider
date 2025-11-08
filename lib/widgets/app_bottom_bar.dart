import 'package:donut_app_ui/services/bottom_bar_selection_service.dart';
import 'package:donut_app_ui/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Consumer<BottomBarSelectionService>(
        builder: (context, provider, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  provider.setTabSelection('main');
                },
                icon: Icon(Icons.trip_origin),
                color: Utils.mainColor,
              ),
              IconButton(
                onPressed: () {
                  provider.setTabSelection('favorites');
                },
                icon: Icon(Icons.favorite),
                color: Utils.mainColor,
              ),
              IconButton(
                onPressed: () {
                  provider.setTabSelection('shoppingcart');
                },
                icon: Icon(Icons.shopping_cart),
                color: Utils.mainColor,
              ),
            ],
          );
        },
      ),
    );
  }
}
