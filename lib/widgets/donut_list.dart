import 'package:donut_app_ui/constants/donut_list_mock_data.dart';
import 'package:donut_app_ui/widgets/donut_card.dart';
import 'package:flutter/material.dart';

class DonutList extends StatefulWidget {
  const DonutList({super.key});

  @override
  State<DonutList> createState() => _DonutListState();
}

class _DonutListState extends State<DonutList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: donuts.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return DonutCard(donutInfo: donuts[index]);
      },
    );
  }
}
