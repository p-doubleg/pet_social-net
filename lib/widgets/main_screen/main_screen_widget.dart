import 'package:flutter/material.dart';
import 'package:vk/widgets/friend_list/friend_list_widget.dart';
import 'package:vk/widgets/news_list/news_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;
  final Map<int, String> _titles = {
    0: 'Feed',
    1: 'Chats',
    2: 'Friends',
  };

  void onSelectTab(int index) {
    if (index == _selectedTab) return;
    _selectedTab = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(_titles[_selectedTab]!),
        backgroundColor: Colors.white,
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: const [
          ColoredBox(color: Color(0xFFECEDF1), child: NewsListWidget()),
          Text('Chats'),
          FriendListWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: onSelectTab,
        selectedItemColor: const Color(0xFF2D81E1),
        iconSize: 28,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: _titles[0],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat_bubble_outline),
            label: _titles[1],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.people_alt_outlined),
            label: _titles[2],
          ),
        ],
      ),
    );
  }
}
