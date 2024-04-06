import 'package:flutter/material.dart';
import 'package:vk/widgets/auth/auth_widget.dart';
import 'package:vk/widgets/main_screen/main_screen_widget.dart';
import 'package:vk/widgets/news_details/news_details_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/auth': (context) => const AuthWidget(),
        '/main_screen': (context) => const MainScreenWidget(),
        '/main_screen/news_details': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return NewsDetailsWidget(newsId: arguments);
          }
          return const NewsDetailsWidget(newsId: 0);
        },
      },
      initialRoute: '/auth',
    );
  }
}
