import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk/ui/widgets/friend_list/friend_list_model.dart';

class FriendListScreen extends StatelessWidget {
  const FriendListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<FriendListScreenModel>();
    model.getFriends();
    final friends = model.friends;
    final friendsCount = friends.length;
    final onFriendTap = model.onFriendTap;

    return ListView.builder(
        itemCount: friendsCount,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => onFriendTap(context, index),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 50,
                    color: Color(0xFF9BA3AD),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    friends[index].email,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chat_bubble_outline),
                    color: const Color(0xFF2D81E1),
                  )
                ],
              ),
            ),
          );
        });
  }
}
