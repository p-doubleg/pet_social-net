import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk/ui/widgets/news/news_list/news_list_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NewsListScreenModel>();
    model.getNews();

    final newsCount = model.news.length;

    return ListView.builder(
      itemCount: newsCount,
      itemBuilder: (BuildContext context, int index) {
        return _NewsCardWidget(index: index);
      },
    );
  }
}

class _NewsCardWidget extends StatelessWidget {
  const _NewsCardWidget({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final model = context.read<NewsListScreenModel>();
    final news = model.news[index];
    onNewsTap() => model.onNewsTap(context, index);
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.only(top: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => onNewsTap(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(2, 6, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.account_circle,
                    size: 45,
                    color: Color(0xFF9BA3AD),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          news.authorName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          timeago.format(news.createdAt),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF9BA3AD),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      color: Color(0xFF9BA3AD),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 12, 12, 0),
                child: Text(
                  news.text,
                  maxLines: 7,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Color(0xFF9BA3AD),
                    ),
                    label: Text(
                      news.likesCount.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF9BA3AD),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
