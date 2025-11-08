import 'package:donut_app_ui/screens/home_screen.dart';
import 'package:donut_app_ui/utils/util.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController donutController;
  late Animation<double> rotationAnimation;

  @override
  void initState() {
    super.initState();
    donutController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();

    rotationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: donutController, curve: Curves.ease));
  }

  @override
  void dispose() {
    donutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Utils.mainAppNav.currentState!.pushReplacementNamed('/main');
    });

    return Scaffold(
      backgroundColor: Utils.mainColor,
      body: Center(
        child: Column(
          spacing: 35,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: rotationAnimation,
              child: Image.network(Utils.donutLogoWhiteNoText),
            ),

            Image.network(Utils.donutLogoWhiteText),
          ],
        ),
      ),
    );
  }
}
