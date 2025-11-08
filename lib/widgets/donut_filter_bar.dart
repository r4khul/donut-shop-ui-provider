import 'package:donut_app_ui/services/filter_bar_service.dart';
import 'package:donut_app_ui/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonutFilterBar extends StatelessWidget {
  const DonutFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(20),
      child: Consumer<FilterBarService>(
        builder: (context, provider, child) {
          final filterItems = provider.filterBarItems;
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(filterItems.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      provider.filterBySelectedDonutType(
                        filterItems[index].id!,
                      );
                    },
                    child: Text(
                      filterItems[index].label!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color:
                            provider.selectedDonutType == filterItems[index].id
                            ? Utils.mainColor
                            : Colors.grey,
                      ),
                    ),
                  );
                }),
              ),
            ],
          );
        },
      ),
    );
  }
}
