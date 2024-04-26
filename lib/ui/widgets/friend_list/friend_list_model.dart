import 'package:flutter/material.dart';
import 'package:vk/domains/entity/user.dart';
import 'package:vk/domains/services/db_service.dart';
import 'package:vk/ui/navigation/navigator_service.dart';

class FriendListScreenModel extends ChangeNotifier {
  final _db = DBService();
  List<UserModel>? _friends;
  List<UserModel> get friends => List.unmodifiable(_friends ?? []);

  void getFriends() async {
    _friends = await _db.getUsersFriends();
    notifyListeners();
  }

  void onFriendTap(
    BuildContext context,
    int index,
  ) {
    final user = _friends?[index];

    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.profileScreen,
      arguments: user,
    );
  }
}
