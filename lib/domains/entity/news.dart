import 'package:cloud_firestore/cloud_firestore.dart';

class News {
  final String authorUID;
  final String authorName;
  final String text;
  final DateTime createdAt;
  final int likesCount;

  News({
    required this.authorUID,
    required this.authorName,
    required this.text,
    required this.createdAt,
    required this.likesCount,
  });

  factory News.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data();
    return News(
      authorUID: data?['authorUID'],
      authorName: data?['authorName'],
      text: data?['text'],
      createdAt: (data?['createdAt'] as Timestamp).toDate(),
      likesCount: data?['likes'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "authorUID": authorUID,
      "authorName": authorName,
      "text": text,
      "createdAt": Timestamp.fromDate(createdAt),
      "likes": likesCount,
    };
  }
}
