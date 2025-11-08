import 'package:donut_app_ui/constants/donut_list_mock_data.dart';
import 'package:donut_app_ui/models/donut.dart';
import 'package:donut_app_ui/models/donut_filter_bar_item.dart';
import 'package:flutter/material.dart';

class FilterBarService extends ChangeNotifier {

  List<DonutModel> filteredDonuts = [];
  String? selectedDonutType;

  List<DonutFilterBarItem> filterBarItems = [
    DonutFilterBarItem(id: 'classic', label: 'Classic'),
    DonutFilterBarItem(id: 'sprinkled', label: 'Sprinkled'),
    DonutFilterBarItem(id: 'stuffed', label: 'Stuffed'),
  ];

  FilterBarService() {
    selectedDonutType = 'classic';
    filteredDonuts = donuts.where((e) => e.type == selectedDonutType).toList();
  }

  void filterBySelectedDonutType(String selectedType) {
    selectedDonutType = selectedType;
    filteredDonuts = donuts.where((e) => e.type == selectedDonutType).toList();
    notifyListeners();
  }
}
