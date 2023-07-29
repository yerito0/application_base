import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScreenController extends ChangeNotifier {
  int _index = 0;
  List<String> rotues = ['/a', '/b'];

  int get index => _index;
  set index(int value) {
    _index = value;
    if (_index != value) {
      notifyListeners();
    }
  }

  void goBranch(int index, StatefulNavigationShell navigationShell) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
    _index = index;
    notifyListeners();
  }

  void goBranchShell(int index) {
    _index = index;
    notifyListeners();
  }
}
