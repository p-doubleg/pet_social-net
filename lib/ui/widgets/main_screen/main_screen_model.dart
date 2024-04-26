import 'package:flutter/material.dart';
import 'package:vk/domains/entity/user.dart';
import 'package:vk/domains/services/auth_service.dart';
import 'package:vk/ui/navigation/navigator_service.dart';

class MainScreenModel extends ChangeNotifier {
  final _authService = AuthService();
  int selectedTab = 0;
  final Map<int, String> titles = {
    0: 'Feed',
    1: 'Friends',
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

  void onProfileTap(BuildContext context, UserModel user) {
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.profileScreen, arguments: user);
  }

  UserModel getUser() {
    final user = _authService.isSingIn()!;
    final userModel = UserModel(uid: user.uid, email: user.email!);
    titles[2] = userModel.email;
    return userModel;
  }
}
