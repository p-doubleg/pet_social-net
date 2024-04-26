import 'package:flutter/material.dart';
import 'package:vk/domains/entity/user.dart';
import 'package:vk/domains/factories/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const loaderScreen = '';
  static const authScreen = 'auth';
  static const registrationScreen = 'registration';
  static const mainScreen = 'main_screen';
  static const newsAddScreen = 'main_screen/news_add';
  static const newsDetailsScreen = 'main_screen/news_details';
  static const profileScreen = 'main_screen/profile_screen';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.loaderScreen: (_) => _screenFactory.makeLoader(),
    MainNavigationRouteNames.authScreen: (_) => _screenFactory.makeAuthScreen(),
    MainNavigationRouteNames.registrationScreen: (_) =>
        _screenFactory.makeRegistrationScreen(),
    MainNavigationRouteNames.mainScreen: (_) => _screenFactory.makeMainScreen(),
    MainNavigationRouteNames.newsAddScreen: (_) =>
        _screenFactory.makeNewsAddScreen(),
  };
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.newsDetailsScreen:
        final arguments = settings.arguments;
        final newsId = arguments is String ? arguments : 'error';
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeNewsDetailsScreen(newsId),
        );
      case MainNavigationRouteNames.profileScreen:
        final arguments = settings.arguments;
        final user = arguments as UserModel;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeProfileScreen(user),
        );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (_) => widget);
    }
  }
}
