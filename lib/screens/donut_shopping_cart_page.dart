import 'package:donut_app_ui/services/shopping_cart_service.dart';
import 'package:donut_app_ui/utils/util.dart';
import 'package:donut_app_ui/widgets/donut_shopping_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonutShoppingCartPage extends StatefulWidget {
  const DonutShoppingCartPage({super.key});

  @override
  State<DonutShoppingCartPage> createState() => _DonutShoppingCartPageState();
}

class _DonutShoppingCartPageState extends State<DonutShoppingCartPage>
    with SingleTickerProviderStateMixin {
  late AnimationController titleAnimation;

  @override
  void initState() {
    super.initState();
    titleAnimation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..forward();
  }

  @override
  void dispose() {
    titleAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: titleAnimation,
                curve: Curves.easeInCubic,
              ),
            ),
            child: Image.network(Utils.donutTitleMyDonuts, width: 165),
          ),
          Expanded(
            child: Consumer<ShoppingCartService>(
              builder: (context, provider, child) {
                if (provider.donuts.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart, size: 50, color: Colors.grey),
                        SizedBox(height: 20),
                        Text(
                          "You don't have any items \n on your cart yet!",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ],
                    ),
                  );
                }

                return DonutShoppingList(
                  donutCart: provider.donuts,
                  cartService: provider,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
