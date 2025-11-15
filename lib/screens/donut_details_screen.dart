import 'package:donut_app_ui/models/donut.dart';
import 'package:donut_app_ui/services/favorites_service.dart';
import 'package:donut_app_ui/services/filter_bar_service.dart';
import 'package:donut_app_ui/services/shopping_cart_service.dart';
import 'package:donut_app_ui/utils/util.dart';
import 'package:donut_app_ui/widgets/cart_badge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonutDetailsScreen extends StatefulWidget {
  const DonutDetailsScreen({super.key});

  @override
  State<DonutDetailsScreen> createState() => _DonutDetailsScreenState();
}

class _DonutDetailsScreenState extends State<DonutDetailsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    )..repeat();

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DonutModel donut = context.read<FilterBarService>().selectedDonut;
    return Scaffold(
      appBar: AppBar(
        title: Image.network(Utils.donutLogoRedText, width: 150),
        centerTitle: true,
        foregroundColor: Utils.mainDark,
        actions: [CartBadge()],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Stack(
              children: [
                Positioned(
                  child: Hero(
                    tag: donut.name!,
                    child: RotationTransition(
                      turns: _rotationAnimation,
                      child: Image.network(
                        donut.imgUrl!,
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width * 1.25,
                      ),
                    ),
                  ),
                  right: -120,
                  top: -40,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          donut.name!,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Utils.mainDark,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<FavoritesService>().addItem(donut);
                        },
                        icon: Icon(
                          context.watch<FavoritesService>().findItem(donut)
                              ? Icons.favorite
                              : Icons.favorite_outline_outlined,
                          color: Utils.mainDark,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                    decoration: BoxDecoration(
                      color: Utils.mainDark,
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: Text(
                      '\$${donut.price!.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    donut.description!,
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16),

                  Consumer<ShoppingCartService>(
                    builder: (context, provider, child) {
                      if (!provider.findItem(donut)) {
                        return InkWell(
                          onTap: () {
                            provider.addItem(donut);
                          },
                          splashFactory: InkSplash.splashFactory,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: Utils.mainColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              spacing: 8,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.shopping_cart,
                                  color: Utils.mainDark,
                                ),
                                Text(
                                  'Add to Cart',
                                  style: TextStyle(color: Utils.mainDark),
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      return Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          spacing: 8,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check, color: Utils.mainDark),
                            Text(
                              'Added to Cart',
                              style: TextStyle(color: Utils.mainDark),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
