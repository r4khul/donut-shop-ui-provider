import 'package:donut_app_ui/services/shopping_cart_service.dart';
import 'package:donut_app_ui/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingCartService>(
      builder: (context, provider, child) {
        if (provider.donuts.isEmpty) return SizedBox();
        return Transform.scale(
          scale: 0.95,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Utils.mainColor,
            ),
            padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
            margin: EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Text(
                  '${provider.donuts.length}',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 10,),
                Icon(Icons.shopping_cart, color: Colors.white, size: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
