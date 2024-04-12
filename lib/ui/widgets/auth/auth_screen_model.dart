import 'package:flutter/material.dart';
import 'package:vk/domains/services/auth_service.dart';
import 'package:vk/ui/navigation/navigator_service.dart';

class AuthScreenModel extends ChangeNotifier {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final authService = AuthService();
  bool buttonIsActive = true;
  String? errorText;

  Future<void> login(BuildContext context) async {
    buttonIsActive = false;
    notifyListeners();
    final email = emailTextController.text;
    final password = passwordTextController.text;
    if (email.isEmpty || password.isEmpty) {
      errorText = 'Please enter email and password';
    } else {
      errorText = await authService.login(email: email, password: password);
      if (errorText == null) {
        redirectOnMainScreen(context);
      }
    }
    buttonIsActive = true;
    notifyListeners();
  }

  redirectOnSignUp(BuildContext context) async {
    await Navigator.of(context)
        .pushReplacementNamed(MainNavigationRouteNames.registrationScreen);
  }

  redirectOnMainScreen(BuildContext context) {
    Navigator.of(context)
        .pushReplacementNamed(MainNavigationRouteNames.mainScreen);
  }
}
