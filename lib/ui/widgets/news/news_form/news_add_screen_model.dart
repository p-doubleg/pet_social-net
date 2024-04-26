import 'package:flutter/material.dart';
import 'package:vk/domains/services/auth_service.dart';
import 'package:vk/domains/services/db_service.dart';

class NewsAddScreenModel {
  final _db = DBService();
  final _authService = AuthService();
  final newsTextController = TextEditingController();

  void saveNews(BuildContext context) async {
    final newsText = newsTextController.text;
    final userUID = _authService.isSingIn()!.uid;
    final user = await _db.getUser(userUID);
    _db.addNews(user, newsText);

    Navigator.of(context).pop();
  }
}
