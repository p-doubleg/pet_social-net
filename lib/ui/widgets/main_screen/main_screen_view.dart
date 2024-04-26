import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk/ui/widgets/friend_list/friend_list_model.dart';
import 'package:vk/ui/widgets/friend_list/friend_list_view.dart';
import 'package:vk/ui/widgets/main_screen/main_screen_model.dart';
import 'package:vk/ui/widgets/news/news_list/news_list_model.dart';
import 'package:vk/ui/widgets/news/news_list/news_list_view.dart';
import 'package:vk/ui/widgets/profile/profile_model.dart';
import 'package:vk/ui/widgets/profile/profile_view.dart';

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

    return Scaffold(
      backgroundColor: const Color(0xFFECEDF1),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(titles[selectedTab]!),
        backgroundColor: Colors.white,
        actions: [
          if (selectedTab == 2)
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
          ChangeNotifierProvider(
            create: (_) => ProfileScreenModel(),
            child: ProfileScreen(user: user),
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
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
