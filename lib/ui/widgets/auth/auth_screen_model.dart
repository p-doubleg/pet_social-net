import 'package:flutter/material.dart';
import 'package:vk/domains/services/auth_service.dart';
import 'package:vk/ui/navigation/navigator_service.dart';

class AuthScreenModel extends ChangeNotifier {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final authService = AuthService();
  String? errorText;

  Future<void> login(BuildContext context) async {
    final email = emailTextController.text;
    final password = passwordTextController.text;
    authService.login(email: email, password: password);
    Navigator.of(context)
        .pushReplacementNamed(MainNavigationRouteNames.mainScreen);
  }

  redirectOnSignUp(BuildContext context) async {
    await Navigator.of(context)
        .pushReplacementNamed(MainNavigationRouteNames.registrationScreen);
  }
}
