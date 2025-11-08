import 'package:donut_app_ui/models/donut_pager.dart';
import 'package:donut_app_ui/utils/util.dart';
import 'package:flutter/material.dart';

class DonutPagerView extends StatefulWidget {
  const DonutPagerView({super.key});

  @override
  State<DonutPagerView> createState() => _DonutPagerViewState();
}

class _DonutPagerViewState extends State<DonutPagerView> {
  late final PageController mainPageController;
  int currentPage = 0;

  final List<DonutPager> pages = [
    DonutPager(imgUrl: Utils.donutPromo1, logoUrl: Utils.donutLogoWhiteText),
    DonutPager(imgUrl: Utils.donutPromo2, logoUrl: Utils.donutLogoWhiteText),
    DonutPager(imgUrl: Utils.donutPromo3, logoUrl: Utils.donutLogoRedText),
  ];

  @override
  void initState() {
    super.initState();
    mainPageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    mainPageController.dispose();
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
              controller: mainPageController,
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
          SizedBox(height: 10),
          PageViewIndicator(
            controller: mainPageController,
            numberOfPages: pages.length,
            currentPage: currentPage,
          ),
        ],
      ),
    );
  }
}

class PageViewIndicator extends StatelessWidget {
  final PageController controller;
  final int numberOfPages;
  final int currentPage;

  const PageViewIndicator({
    super.key,
    required this.controller,
    required this.numberOfPages,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: List.generate(numberOfPages, (index) {
        return GestureDetector(
          onTap: () {
            controller.animateToPage(
              index,
              duration: Duration(milliseconds: 400),
              curve: Curves.linear,
            );
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentPage == index ? Utils.mainColor : Colors.grey,
              ),
            ),
          ),
        );
      }),
    );
  }
}
