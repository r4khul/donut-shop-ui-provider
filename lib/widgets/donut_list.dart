import 'package:donut_app_ui/models/donut.dart';
import 'package:donut_app_ui/widgets/donut_card.dart';
import 'package:flutter/material.dart';

class DonutList extends StatefulWidget {
  final List<DonutModel> donutItems;
  const DonutList({super.key, required this.donutItems});

  @override
  State<DonutList> createState() => _DonutListState();
}

class _DonutListState extends State<DonutList> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  List<DonutModel> insertedItems = [];

  @override
  void initState() {
    super.initState();

    var future = Future(() {});
    for (var i = 0; i < widget.donutItems.length; i++) {
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 200), () {
          insertedItems.add(widget.donutItems[i]);
          _key.currentState!.insertItem(i);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _key,
      initialItemCount: insertedItems.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index, animation) {
        DonutModel donut = insertedItems[index];
        return SlideTransition(
          position: Tween(begin: Offset(0.2, 0.0), end: Offset(0.0, 0.0))
              .animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut),
              ),
          child: FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut),
            ),
            child: DonutCard(donutInfo: donut),
          ),
        );
      },
    );
  }
}
