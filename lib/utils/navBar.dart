import 'package:flutter/material.dart';
import 'package:chatzy/pages.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  final pages = [
  MainPage(),
  ChatPage(),
  NotificationsPage(),
  ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
