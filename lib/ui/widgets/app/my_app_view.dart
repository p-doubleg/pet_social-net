import 'package:flutter/material.dart';
import 'package:vk/domains/services/auth_service.dart';
import 'package:vk/ui/navigation/navigator_service.dart';

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();
    final user = authService.isSingIn();
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: mainNavigation.routes,
      initialRoute: user == null
          ? MainNavigationRouteNames.authScreen
          : MainNavigationRouteNames.mainScreen,
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}
