import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;

  UserModel({
    required this.uid,
    required this.email,
  });

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data();
    return UserModel(
      uid: data?['uid'],
      email: data?['username'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "uid": uid,
      "username": email,
    };
  }
}
