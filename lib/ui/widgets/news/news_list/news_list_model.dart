import 'package:flutter/material.dart';
import 'package:vk/domains/entity/news.dart';
import 'package:vk/domains/services/db_service.dart';
import 'package:vk/ui/navigation/navigator_service.dart';

class NewsListScreenModel extends ChangeNotifier {
  final _db = DBService();
  List<News>? _news;
  List<News> get news => List.unmodifiable(_news ?? []);

  void getNews() async {
    _news = await _db.getNews();
    notifyListeners();
  }

  void onNewsTap(
    BuildContext context,
    int index,
  ) {
    final id = _news?[index].authorUID;

    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.newsDetailsScreen,
      arguments: id,
    );
  }
}
