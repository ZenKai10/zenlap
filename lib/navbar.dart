import 'package:flutter/material.dart';
// import 'package:review_anime/home_user.dart';
// import 'package:review_anime/list_page.dart';
// import 'package:review_anime/profil.dart';
// import 'package:uas/tmp/list_page.dart';
import 'package:zenlap/list_page.dart';
import 'package:zenlap/profil.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List pages = [ListPage(), const Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profil'),
        ],
        selectedItemColor: Color.fromARGB(255, 11, 53, 115),
        unselectedItemColor: Color.fromARGB(255, 99, 95, 95),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 30,
      ),
    );
  }
}
