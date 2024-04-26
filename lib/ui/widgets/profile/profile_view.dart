import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk/ui/widgets/custom/news_card_widget.dart';
import 'package:vk/ui/widgets/profile/profile_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileScreenModel>();
    model.getNewsByUser(user.uid);
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
