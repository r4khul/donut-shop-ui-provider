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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.donutItems.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return DonutCard(donutInfo: widget.donutItems[index]);
      },
    );
  }
}
