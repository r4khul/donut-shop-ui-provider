import 'package:donut_app_ui/models/donut.dart';
import 'package:donut_app_ui/services/filter_bar_service.dart';
import 'package:donut_app_ui/widgets/donut_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonutList extends StatefulWidget {
  final List<DonutModel> donutItems;
  const DonutList({super.key, required this.donutItems});

  @override
  State<DonutList> createState() => _DonutListState();
}

class _DonutListState extends State<DonutList> {
  GlobalKey<AnimatedListState> _key = GlobalKey();
  List<DonutModel> insertedItems = [];

  @override
  void initState() {
    super.initState();

    _populateListFromWidgetItems();
  }

  @override
  void didUpdateWidget(covariant DonutList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.donutItems != widget.donutItems) {
      _key = GlobalKey<AnimatedListState>();
      insertedItems = [];
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _populateListFromWidgetItems();
      });
    }
  }

  void _populateListFromWidgetItems() {
    var future = Future(() {});
    for (var i = 0; i < widget.donutItems.length; i++) {
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 200), () {
          if (!mounted) return;
          insertedItems.add(widget.donutItems[i]);
          _key.currentState?.insertItem(i);
          setState(() {});
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
            child: GestureDetector(
              onTap: () {
                context.read<FilterBarService>().setDonutSelected(donut);
              },
              child: DonutCard(donutInfo: donut),
            ),
          ),
        );
      },
    );
  }
}
