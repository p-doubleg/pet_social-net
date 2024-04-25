import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String username;

  UserModel({
    required this.uid,
    required this.username,
  });

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data();
    return UserModel(
      uid: data?['uid'],
      username: data?['username'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "uid": uid,
      "username": username,
    };
  }
}
