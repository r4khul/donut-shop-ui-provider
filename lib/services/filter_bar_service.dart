import 'package:donut_app_ui/models/donut_filter_bar_item.dart';
import 'package:flutter/material.dart';

class FilterBarService extends ChangeNotifier {
  List<DonutFilterBarItem> filterBarItems = [
    DonutFilterBarItem(id: 'classic', label: 'Classic'),
    DonutFilterBarItem(id: 'sprinkled', label: 'Sprinkled'),
    DonutFilterBarItem(id: 'stuffed', label: 'Stuffed'),
  ];

  FilterBarService() {
    selectedDonutType = 'classic';
  }

  String? selectedDonutType;

  void filterBySelectedDonutType(String selectedType) {
    selectedDonutType = selectedType;
    notifyListeners();
  }
}
