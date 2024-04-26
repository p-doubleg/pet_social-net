import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk/ui/widgets/custom/news_card_widget.dart';
import 'package:vk/ui/widgets/news/news_list/news_list_model.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NewsListScreenModel>();
    model.getNews();
    final news = model.news;
    final newsCount = news.length;
    final onNewsTap = model.onNewsTap;

    return ListView.builder(
      itemCount: newsCount,
      itemBuilder: (BuildContext context, int index) {
        return NewsCardWidget(
          news: news[index],
          onNewsTap: () => onNewsTap(context, index),
        );
      },
    );
  }
}
