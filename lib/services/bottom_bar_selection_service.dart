import 'package:donut_app_ui/utils/util.dart';
import 'package:flutter/material.dart';

class BottomBarSelectionService extends ChangeNotifier {
  String? tabSelection = 'main';

  void setTabSelection(String selection) {
    Utils.mainListNav.currentState!.pushReplacementNamed('/$selection');
    tabSelection = selection;
    notifyListeners();
  }
}
