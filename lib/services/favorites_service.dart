import 'package:donut_app_ui/models/donut.dart';
import 'package:flutter/material.dart';

class FavoritesService extends ChangeNotifier {
  List<DonutModel> donuts = [];

  void addItem(DonutModel donut) {
    donuts.add(donut);
    notifyListeners();
  }

  void removeItem(DonutModel donut) {
    donuts.removeWhere((d) => d.name == donut.name);
    notifyListeners();
  }

  void clearCart() {
    donuts.clear();
    notifyListeners();
  }

  bool findItem(DonutModel donut) {
    return donuts.any((d) => d.name == donut.name);
  }
}
