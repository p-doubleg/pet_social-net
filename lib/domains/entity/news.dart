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
