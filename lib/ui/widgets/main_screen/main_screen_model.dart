import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vk/domains/services/auth_service.dart';
import 'package:vk/ui/navigation/navigator_service.dart';

class MainScreenModel extends ChangeNotifier {
  final _authService = AuthService();
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

  void onLogOutTap(BuildContext context) {
    _authService.logOut();
    Navigator.of(context)
        .pushReplacementNamed(MainNavigationRouteNames.authScreen);
  }

  User getUser() {
    final user = _authService.isSingIn()!;
    titles[2] = user.email!;
    return user;
  }
}
