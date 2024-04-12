import 'package:flutter/material.dart';
import 'package:vk/ui/navigation/navigator_service.dart';

class News {
  final int id;
  final String author;
  final String text;
  final String time;
  final int viewsCount;
  final int likesCount;
  final int commentsCount;

  News(
      {required this.id,
      required this.author,
      required this.text,
      required this.time,
      required this.viewsCount,
      required this.likesCount,
      required this.commentsCount});
}

class NewsListWidget extends StatefulWidget {
  const NewsListWidget({super.key});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

final _news = [
  News(
    id: 1,
    author: 'Group 1',
    text:
        'Fusce diam nisl, gravida non vehicula non, ultrices et ante. Curabitur sollicitudin enim id ligula vehicula, ac consectetur lectus varius. Etiam condimentum, dui sit amet aliquam tristique, nisl metus pharetra diam, sit amet congue enim orci nec tellus. Aliquam rutrum fringilla libero id tempus. Integer euismod condimentum tortor vitae condimentum. Nam sed magna id ipsum gravida rutrum bibendum non lacus. Quisque et arcu tincidunt, dapibus ligula a, gravida leo.',
    time: 'April 7, 2021',
    viewsCount: 100,
    likesCount: 100,
    commentsCount: 100,
  ),
  News(
    id: 2,
    author: 'Group 2',
    text:
        'Fusce diam nisl, gravida non vehicula non, ultrices et ante. Curabitur sollicitudin enim id ligula vehicula, ac consectetur lectus varius. Etiam condimentum, dui sit amet aliquam tristique, nisl metus pharetra diam, sit amet congue enim orci nec tellus. Aliquam rutrum fringilla libero id tempus. Integer euismod condimentum tortor vitae condimentum. Nam sed magna id ipsum gravida rutrum bibendum non lacus. Quisque et arcu tincidunt, dapibus ligula a, gravida leo.',
    time: 'April 7, 2021',
    viewsCount: 75,
    likesCount: 50,
    commentsCount: 43,
  ),
  News(
    id: 3,
    author: 'Group 3',
    text:
        'Fusce diam nisl, gravida non vehicula non, ultrices et ante. Curabitur sollicitudin enim id ligula vehicula, ac consectetur lectus varius. Etiam condimentum, dui sit amet aliquam tristique, nisl metus pharetra diam, sit amet congue enim orci nec tellus. Aliquam rutrum fringilla libero id tempus. Integer euismod condimentum tortor vitae condimentum. Nam sed magna id ipsum gravida rutrum bibendum non lacus. Quisque et arcu tincidunt, dapibus ligula a, gravida leo.',
    time: 'April 7, 2021',
    viewsCount: 76,
    likesCount: 32,
    commentsCount: 3,
  ),
  News(
    id: 4,
    author: 'Group 4',
    text:
        'Fusce diam nisl, gravida non vehicula non, ultrices et ante. Curabitur sollicitudin enim id ligula vehicula, ac consectetur lectus varius. Etiam condimentum, dui sit amet aliquam tristique, nisl metus pharetra diam, sit amet congue enim orci nec tellus. Aliquam rutrum fringilla libero id tempus. Integer euismod condimentum tortor vitae condimentum. Nam sed magna id ipsum gravida rutrum bibendum non lacus. Quisque et arcu tincidunt, dapibus ligula a, gravida leo.',
    time: 'April 7, 2021',
    viewsCount: 84,
    likesCount: 31,
    commentsCount: 10,
  ),
  News(
    id: 5,
    author: 'Group 5',
    text:
        'Fusce diam nisl, gravida non vehicula non, ultrices et ante. Curabitur sollicitudin enim id ligula vehicula, ac consectetur lectus varius. Etiam condimentum, dui sit amet aliquam tristique, nisl metus pharetra diam, sit amet congue enim orci nec tellus. Aliquam rutrum fringilla libero id tempus. Integer euismod condimentum tortor vitae condimentum. Nam sed magna id ipsum gravida rutrum bibendum non lacus. Quisque et arcu tincidunt, dapibus ligula a, gravida leo.',
    time: 'April 7, 2021',
    viewsCount: 22,
    likesCount: 5,
    commentsCount: 2,
  ),
];

class _NewsListWidgetState extends State<NewsListWidget> {
  void _onNewsTap(int index) {
    final id = _news[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.newsDetailsScreen,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _news.length,
      itemBuilder: (BuildContext context, int index) {
        final news = _news[index];
        return Card(
          elevation: 0,
          color: Colors.white,
          margin: const EdgeInsets.only(top: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => _onNewsTap(index),
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
                              news.author,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              news.time,
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
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border_rounded,
                          color: Color(0xFF9BA3AD),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.insert_comment_rounded,
                          color: Color(0xFF9BA3AD),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.reply_rounded,
                          color: Color(0xFF9BA3AD),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.remove_red_eye_rounded,
                        color: Color(0xFF9BA3AD),
                      ),
                      const SizedBox(width: 4),
                      //TODO views formatting
                      Text(
                        news.viewsCount.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF9BA3AD),
                        ),
                      ),
                      const SizedBox(width: 12)
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
