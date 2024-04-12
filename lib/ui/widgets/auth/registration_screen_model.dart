import 'package:flutter/material.dart';
import 'package:vk/domains/services/auth_service.dart';
import 'package:vk/ui/navigation/navigator_service.dart';

class RegistrationScreenModel extends ChangeNotifier {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final authService = AuthService();
  String? errorText;

  void register(BuildContext context) {
    final email = emailTextController.text;
    final password = passwordTextController.text;
    authService.register(email: email, password: password);
    Navigator.of(context)
        .pushReplacementNamed(MainNavigationRouteNames.mainScreen);
  }

  redirectOnLogIn(BuildContext context) {
    Navigator.of(context)
        .pushReplacementNamed(MainNavigationRouteNames.authScreen);
  }
}
