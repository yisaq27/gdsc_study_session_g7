import 'package:first_app/homepage.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentIndex = 2;
  List pages = [
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Image.asset('assets/web-content.png'),
            title: const Text("content"),
            selectedColor: Colors.orange,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Image.asset('assets/open-book.png'),
            title: const Text("openbook"),
            selectedColor: Colors.orange,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Image.asset('assets/home-button 1.png'),
            title: const Text("home"),
            selectedColor: Colors.orange,
          ),

          /// Book
          SalomonBottomBarItem(
            icon: Image.asset('assets/book.png'),
            title: const Text("books"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Image.asset('assets/user (2) 1.png'),
            title: const Text("me"),
            selectedColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}
