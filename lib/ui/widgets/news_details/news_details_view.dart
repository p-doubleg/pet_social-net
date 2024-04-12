import 'package:flutter/material.dart';

class NewsDetailsWidget extends StatefulWidget {
  final int newsId;
  const NewsDetailsWidget({
    super.key,
    required this.newsId,
  });

  @override
  State<NewsDetailsWidget> createState() => _NewsDetailsWidgetState();
}

class _NewsDetailsWidgetState extends State<NewsDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(widget.newsId.toString()));
  }
}
