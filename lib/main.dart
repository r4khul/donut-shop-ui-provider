import 'package:donut_app_ui/screens/donut_details_screen.dart';
import 'package:donut_app_ui/screens/home_screen.dart';
import 'package:donut_app_ui/screens/splash_screen.dart';
import 'package:donut_app_ui/services/bottom_bar_selection_service.dart';
import 'package:donut_app_ui/services/filter_bar_service.dart';
import 'package:donut_app_ui/services/shopping_cart_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:donut_app_ui/utils/util.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomBarSelectionService(),
        ),
        ChangeNotifierProvider(
          create: (context) => FilterBarService(),
        ),
        ChangeNotifierProvider(create: (context) => ShoppingCartService())
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      navigatorKey: Utils.mainAppNav,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/main': (context) => HomeScreen(),
        '/details': (context) => DonutDetailsScreen(),
      },
    );
  }
}
