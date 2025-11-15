import 'package:donut_app_ui/services/favorites_service.dart';
import 'package:donut_app_ui/utils/util.dart';
import 'package:donut_app_ui/widgets/donut_shopping_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonutFavoritesPage extends StatefulWidget {
  const DonutFavoritesPage({super.key});

  @override
  State<DonutFavoritesPage> createState() => _DonutFavoritesPageState();
}

class _DonutFavoritesPageState extends State<DonutFavoritesPage>
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
            child: Image.network(Utils.donutTitleFavorites, width: 165),
          ),
          Expanded(
            child: Consumer<FavoritesService>(
              builder: (context, provider, child) {
                if (provider.donuts.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite, size: 50, color: Colors.grey),
                        SizedBox(height: 20),
                        Text(
                          "You don't have any items \n on favorites yet!",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                onPressed: context.watch<FavoritesService>().donuts.isNotEmpty
                    ? () {
                        context.read<FavoritesService>().clearCart();
                      }
                    : null,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Utils.mainColor,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.all(10),
                  child: Row(
                    children: [Icon(Icons.delete_forever), Text("Clear Favorites")],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
