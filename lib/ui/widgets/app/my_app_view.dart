import 'package:flutter/material.dart';
import 'package:vk/ui/navigation/navigator_service.dart';

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: mainNavigation.routes,
      initialRoute: MainNavigationRouteNames.authScreen,
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}
