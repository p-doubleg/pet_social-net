import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk/ui/widgets/friend_list/friend_list_model.dart';
import 'package:vk/ui/widgets/friend_list/friend_list_view.dart';
import 'package:vk/ui/widgets/main_screen/main_screen_model.dart';
import 'package:vk/ui/widgets/news/news_list/news_list_model.dart';
import 'package:vk/ui/widgets/news/news_list/news_list_view.dart';

class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenModel>();
    final titles = model.titles;
    final selectedTab = model.selectedTab;
    final user = model.getUser();
    onAddNews() => model.onAddNewsTap(context);
    onLogOut() => model.onLogOutTap(context);
    onProfile() => model.onProfileTap(context, user);

    return Scaffold(
      backgroundColor: const Color(0xFFECEDF1),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(titles[selectedTab]!),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: onProfile,
          icon: const Icon(
            Icons.account_circle,
            size: 35,
            color: Color(0xFF9BA3AD),
          ),
        ),
        actions: [
          IconButton(
            onPressed: onLogOut,
            icon: const Icon(Icons.logout),
          )
        ],
        // automaticallyImplyLeading: false,
      ),
      body: IndexedStack(
        index: selectedTab,
        children: [
          ChangeNotifierProvider(
            create: (_) => NewsListScreenModel(),
            child: const NewsListScreen(),
          ),
          ChangeNotifierProvider(
            create: (_) => FriendListScreenModel(),
            child: const FriendListScreen(),
          ),
        ],
      ),
      floatingActionButton: selectedTab != 0
          ? null
          : FloatingActionButton(
              onPressed: onAddNews,
              backgroundColor: Colors.white,
              shape: const CircleBorder(),
              child: const Icon(Icons.add),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
        onTap: model.onSelectTab,
        selectedItemColor: const Color(0xFF2D81E1),
        iconSize: 28,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined),
            label: 'Friends',
          ),
        ],
      ),
    );
  }
}
