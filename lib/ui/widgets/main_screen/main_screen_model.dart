import 'package:flutter/material.dart';
import 'package:vk/ui/navigation/navigator_service.dart';

class MainScreenModel extends ChangeNotifier {
  int selectedTab = 0;
  final Map<int, String> titles = {
    0: 'Feed',
    1: 'Friends',
    2: 'Profile',
  };

  void onSelectTab(int index) {
    if (index == selectedTab) return;
    selectedTab = index;
    notifyListeners();
  }

  void onAddNewsTap(BuildContext context) {
    Navigator.of(context).pushNamed(MainNavigationRouteNames.newsAddScreen);
  }
}
