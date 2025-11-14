import 'package:donut_app_ui/models/donut.dart';
import 'package:flutter/material.dart';

class ShoppingCartService extends ChangeNotifier {
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

  double getTotal() {
    double total = 0.0;
    donuts.forEach((d) => total += d.price!);
    return total;
  }
}
