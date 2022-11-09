import 'package:chatzy/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatzy/pages.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> pageIndex = ValueNotifier(2);
  final ValueNotifier<String> title = ValueNotifier("Feed");

  final pages = const [
    ChatPage(),
    ExplorePage(),
    MainPage(),
    NotificationsPage(),
    ProfilePage(),
  ];

  final pageTitles = const [
    'Messages',
    'Explore',
    'Home',
    'Notifications',
    'Profile',
  ];

  void _onNavItemSelected(index) {
    title.value = pageTitles[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 1,
        title: ValueListenableBuilder(
          valueListenable: title,
          builder: (BuildContext context, String value, _) {
            return Center(
              child: Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Avatar.small(url: "https://picsum.photos/200/300"),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: _onNavItemSelected,
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({Key? key, required this.onItemSelected})
      : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIndex = 2;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        _NavigationBarItem(
          index: 0,
          label: 'Messages',
          icon: CupertinoIcons.bubble_left_bubble_right_fill,
          isSelected: (selectedIndex == 0),
          onTap: handleItemSelected,
        ),
        _NavigationBarItem(
            index: 1,
            label: 'Explore',
            icon: CupertinoIcons.map,
            isSelected: (selectedIndex == 1),
            onTap: handleItemSelected),
        _NavigationBarItem(
            index: 2,
            label: 'Main',
            icon: CupertinoIcons.house,
            isSelected: (selectedIndex == 2),
            onTap: handleItemSelected),
        _NavigationBarItem(
            index: 3,
            label: 'Notifications',
            icon: CupertinoIcons.bell,
            isSelected: (selectedIndex == 3),
            onTap: handleItemSelected),
        _NavigationBarItem(
            index: 4,
            label: 'Profile',
            icon: CupertinoIcons.profile_circled,
            isSelected: (selectedIndex == 4),
            onTap: handleItemSelected),
      ]),
    );
  }
}

// Navigation Items

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem(
      {Key? key,
      required this.index,
      required this.label,
      required this.icon,
      this.isSelected = false,
      required this.onTap})
      : super(key: key);

  final int index;
  final String label;
  final IconData icon;
  final bool isSelected;
  final ValueChanged<int> onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 20, color: isSelected ? Colors.blue : null),
            const SizedBox(
              height: 12,
            ),
            Text(label,
                style: isSelected
                    ? const TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold)
                    : const TextStyle(fontSize: 12))
          ],
        ),
      ),
    );
  }
}
