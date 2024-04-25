import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk/ui/widgets/auth/auth_screen_model.dart';
import 'package:vk/ui/widgets/auth/auth_screen_view.dart';
import 'package:vk/ui/widgets/auth/registration_screen_model.dart';
import 'package:vk/ui/widgets/auth/registration_screen_view.dart';
import 'package:vk/ui/widgets/loader_screen/loader_screen_model.dart';
import 'package:vk/ui/widgets/loader_screen/loader_screen_view.dart';
import 'package:vk/ui/widgets/main_screen/main_screen_model.dart';
import 'package:vk/ui/widgets/main_screen/main_screen_view.dart';
import 'package:vk/ui/widgets/news/news_details/news_details_screen_view.dart';
import 'package:vk/ui/widgets/news/news_form/news_add_screen_view.dart';

class ScreenFactory {
  Widget makeLoader() {
    return Provider(
      create: (_) => LoaderScreenModel(),
      child: const LoaderScreenWidget(),
    );
  }

  Widget makeAuthScreen() {
    return ChangeNotifierProvider(
      create: (_) => AuthScreenModel(),
      child: const AuthScreenWidget(),
    );
  }

  Widget makeRegistrationScreen() {
    return ChangeNotifierProvider(
      create: (_) => RegistrationScreenModel(),
      child: const RegistrationScreenWidget(),
    );
  }

  Widget makeMainScreen() {
    return ChangeNotifierProvider(
      create: (_) => MainScreenModel(),
      child: const MainScreenWidget(),
    );
  }

  Widget makeNewsDetailsScreen(int newsId) {
    return NewsDetailsScreen(newsId: newsId);
  }

  Widget makeNewsAddScreen() {
    return const NewsAddScreen();
  }
}
