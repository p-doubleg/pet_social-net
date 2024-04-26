import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vk/domains/entity/news.dart';
import 'package:vk/domains/entity/user.dart';

class DBService {
  final _db = FirebaseFirestore.instance;

  void addNews(UserModel user, String text) async {
    await _db.collection('news').add(
      {
        'authorUID': user.uid,
        'authorName': user.email,
        'text': text,
        'createdAt': Timestamp.now(),
        'likes': 0,
      },
    );
  }

  void addUser(UserModel user) async {
    await _db.collection('user').add(
      {
        'uid': user.uid,
        'username': user.email,
      },
    );
  }

  Future<List<News>> getNews() async {
    final snapshot = await _db
        .collection('news')
        .orderBy('createdAt', descending: true)
        .get();
    final newsData = snapshot.docs.map((e) => News.fromFirestore(e)).toList();
    return newsData;
  }

  Future<List<News>> getNewsByUser(String uid) async {
    final snapshot = await _db
        .collection('news')
        .where('authorUID', isEqualTo: uid)
        .orderBy('createdAt', descending: true)
        .get();
    final newsData = snapshot.docs.map((e) => News.fromFirestore(e)).toList();
    return newsData;
  }

  Future<UserModel> getUser(String uid) async {
    final snapshot =
        await _db.collection('user').where('uid', isEqualTo: uid).get();
    final user = snapshot.docs.map((e) => UserModel.fromFirestore(e)).single;
    return user;
  }

  Future<List<UserModel>> getUsersFriends() async {
    final snapshot = await _db.collection('user').get();
    final friendsData =
        snapshot.docs.map((e) => UserModel.fromFirestore(e)).toList();
    return friendsData;
  }
}
