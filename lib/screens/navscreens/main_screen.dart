import 'package:flutter/material.dart';
import 'package:flutter_cubit/screens/home_screen.dart';
import 'package:flutter_cubit/screens/navscreens/search_screen.dart';
import 'package:flutter_cubit/screens/navscreens/bar_item_screen.dart';
import './my_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List screens = [
    const HomeScreen(),
    const BarItemScreen(),
    const SearchScreen(),
    const MyScreen()
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueAccent.withOpacity(0.3),
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54.withOpacity(0.2),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
          BottomNavigationBarItem(
              label: "Bar", icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
          BottomNavigationBarItem(
            label: "My",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
