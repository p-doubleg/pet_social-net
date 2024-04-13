import 'package:flutter/material.dart';
import 'package:vk/domains/services/db_service.dart';
import 'package:vk/ui/navigation/navigator_service.dart';
import 'package:vk/ui/widgets/news_list/news_list_view.dart';

class NewsListScreenModel extends ChangeNotifier {
  // final _news = <News>[];
  List<News> get news => List.unmodifiable(_news);

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

  void onNewsTap(
    BuildContext context,
    int index,
  ) {
    DBService().testAdd();
    final id = _news[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.newsDetailsScreen,
      arguments: id,
    );
  }
}
