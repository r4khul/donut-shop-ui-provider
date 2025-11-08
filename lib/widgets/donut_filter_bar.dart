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
              SizedBox(height: 10),
              AnimatedAlign(
                alignment: markAlignmentBasedOnSelection(
                  id: provider.selectedDonutType!,
                ),
                duration: Duration(milliseconds: 100),
                curve: Curves.easeInOutCirc,
                child: Container(
                  height: 3,
                  width: MediaQuery.of(context).size.width / 3 - 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Utils.mainColor,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

Alignment markAlignmentBasedOnSelection({required String id}) {
  final Alignment markAlign;

  switch (id) {
    case 'classic':
      markAlign = Alignment.centerLeft;
      break;
    case 'sprinkled':
      markAlign = Alignment.center;
      break;
    case 'stuffed':
      markAlign = Alignment.centerRight;
      break;
    default:
      markAlign = Alignment.centerLeft;
  }

  return markAlign;
}
