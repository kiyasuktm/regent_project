import 'package:flutter/material.dart';
import 'package:flutter_pro_test/pages/capi.dart';
import 'package:flutter_pro_test/pages/home.dart';
import 'package:flutter_pro_test/pages/page2.dart';

class BottomNaveBar extends StatefulWidget {
  const BottomNaveBar({super.key});

  @override
  State<BottomNaveBar> createState() => _BottomNaveBarState();
}

class _BottomNaveBarState extends State<BottomNaveBar> {
  int currentIndex = 0;

  final pages = [
    const Page2(),
    const Home(),
    const Capi(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          backgroundColor: Colors.white,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                activeIcon: Icon(Icons.person),
                label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.map_outlined),
                activeIcon: Icon(Icons.map),
                label: 'Location'),
            BottomNavigationBarItem(
                icon: Icon(Icons.emoji_emotions_outlined),
                activeIcon: Icon(Icons.emoji_emotions),
                label: 'Data')
          ]),
    );
  }
}
