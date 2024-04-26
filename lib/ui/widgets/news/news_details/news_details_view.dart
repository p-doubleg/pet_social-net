import 'package:flutter/material.dart';

class NewsDetailsScreen extends StatefulWidget {
  final String newsId;
  const NewsDetailsScreen({
    super.key,
    required this.newsId,
  });

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsWidgetState();
}

class _NewsDetailsWidgetState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(widget.newsId));
  }
}
