import 'package:donut_app_ui/models/donut_pager.dart';
import 'package:donut_app_ui/utils/util.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final PageController _mainPageController;
  int currentPage = 0;

  final List<DonutPager> pages = [
    DonutPager(imgUrl: Utils.donutPromo1, logoUrl: Utils.donutLogoWhiteText),
    DonutPager(imgUrl: Utils.donutPromo2, logoUrl: Utils.donutLogoWhiteText),
    DonutPager(imgUrl: Utils.donutPromo3, logoUrl: Utils.donutLogoRedText),
  ];

  @override
  void initState() {
    super.initState();
    _mainPageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _mainPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: PageView.builder(
              controller: _mainPageController,
              itemCount: pages.length,
              onPageChanged: (index) => setState(() => currentPage = index),
              itemBuilder: (context, index) {
                final currPage = pages[index];
                return Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(30),
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: NetworkImage(currPage.imgUrl!),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Image.network(currPage.logoUrl!, width: 150),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
