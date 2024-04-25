import 'package:flutter/material.dart';
import 'package:vk/domains/factories/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const loaderScreen = '';
  static const authScreen = 'auth';
  static const registrationScreen = 'registration';
  static const mainScreen = 'main_screen';
  static const newsAddScreen = 'main_screen/news_add';
  static const newsDetailsScreen = 'main_screen/news_details';
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
      // case MainNavigationRouteNames.movieTrailerWidget:
      //   final arguments = settings.arguments;
      //   final youtubeKey = arguments is String ? arguments : '';
      //   return MaterialPageRoute(
      //     builder: (_) => _screenFactory.makeMovieTrailer(youtubeKey),
      //   );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (_) => widget);
    }
  }
}
