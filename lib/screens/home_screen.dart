import 'package:donut_app_ui/screens/donut_favorites_page.dart';
import 'package:donut_app_ui/screens/donut_main_page.dart';
import 'package:donut_app_ui/screens/donut_shopping_cart_page.dart';
import 'package:donut_app_ui/utils/util.dart';
import 'package:donut_app_ui/widgets/app_bottom_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(Utils.donutLogoRedText, width: 150),
        foregroundColor: Utils.mainDark,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Navigator(
              key: Utils.mainListNav,
              initialRoute: '/main',
              onGenerateRoute: (RouteSettings settings) {
                Widget page;

                switch (settings.name) {
                  case '/main':
                    page = DonutMainPage();
                  case '/favorites':
                    page = DonutFavoritesPage();
                  case '/shoppingcart':
                    page = DonutShoppingCartPage();
                  default:
                    page = Center(child: Text("main"));
                }

                return PageRouteBuilder(
                  pageBuilder: (_, __, ___) => page,
                  transitionDuration: Duration(seconds: 0),
                );
              },
            ),
          ),
          AppBottomBar(),
        ],
      ),
      drawer: _buildDrawer(),
    );
  }
}

Widget _buildDrawer() {
  return Drawer(
    child: Container(
      padding: EdgeInsets.all(35),
      color: Utils.mainDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(Utils.donutLogoWhiteNoText, height: 150, width: 150),
          Image.network(Utils.donutLogoWhiteText, width: 180),
        ],
      ),
    ),
  );
}
