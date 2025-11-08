import 'package:donut_app_ui/widgets/donut_filter_bar.dart';
import 'package:donut_app_ui/widgets/donut_pager_view.dart';
import 'package:flutter/material.dart';

class DonutMainPage extends StatelessWidget {
  const DonutMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [DonutPagerView(), DonutFilterBar()]);
  }
}
