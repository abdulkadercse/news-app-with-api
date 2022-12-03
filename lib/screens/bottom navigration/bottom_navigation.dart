import 'package:flutter/material.dart';
import 'package:news_app_with_api/screens/bottom%20pages/home_screen.dart';

import '../bottom pages/category.dart';
import '../profile/profile.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;
  List pages = [
    const HomeScreen(),
    const Category(),
    const Profile(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: selectedIndex,
          selectedItemColor: const Color(0xff0601B4),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.tv), label: "Category"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile",),
          ]),
      body: Center(
        child: pages.elementAt(selectedIndex),
      ),
    );
  }
}
