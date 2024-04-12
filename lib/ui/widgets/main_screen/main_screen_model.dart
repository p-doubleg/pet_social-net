import 'package:flutter/foundation.dart';

class MainScreenModel extends ChangeNotifier {
  int selectedTab = 0;
  final Map<int, String> titles = {
    0: 'Feed',
    1: 'Chats',
    2: 'Friends',
  };

  void onSelectTab(int index) {
    if (index == selectedTab) return;
    selectedTab = index;
    notifyListeners();
  }
}
