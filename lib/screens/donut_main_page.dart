import 'package:donut_app_ui/services/filter_bar_service.dart';
import 'package:donut_app_ui/widgets/donut_filter_bar.dart';
import 'package:donut_app_ui/widgets/donut_list.dart';
import 'package:donut_app_ui/widgets/donut_pager_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonutMainPage extends StatelessWidget {
  const DonutMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DonutPagerView(),
        DonutFilterBar(),
        Expanded(
          child: Consumer<FilterBarService>(
            builder: (context, provider, child) {
              return DonutList(donutItems: provider.filteredDonuts);
            },
          ),
        ),
      ],
    );
  }
}
