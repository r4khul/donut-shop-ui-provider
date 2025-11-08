import 'package:donut_app_ui/utils/util.dart';
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
