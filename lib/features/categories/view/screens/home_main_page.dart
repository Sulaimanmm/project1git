import 'package:flutter/material.dart';
import 'package:store_key_and_value/features/categories/view/screens/home_page.dart';
import 'package:store_key_and_value/features/categories/view/screens/profile_page.dart';
import 'package:store_key_and_value/utils/colors/colors.dart';

class HomeMainPage extends StatefulWidget {
  const HomeMainPage({super.key});

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
  final screens = [
    HomePage(),
    ProfilePage(),
    HomePage(),
    HomePage(),
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        mouseCursor: MouseCursor.uncontrolled,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.cyan,
        backgroundColor: containBckclr,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'cart'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        ],
      ),
    );
  }
}
