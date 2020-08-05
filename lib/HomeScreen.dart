import 'package:flutter/material.dart';
import 'package:pocket_guard/ActiveColors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _HomeScreenChild(),
    );
  }
}

class _HomeScreenChild extends StatefulWidget {
  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreenChild> {
  int _selectedIndex = 0;

  void onNavigationItemClicked(int index) {
    setState(() {
      if (index != 2) {
        _selectedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text("Expenses")),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), title: Text("Calendar")),
          BottomNavigationBarItem(
              icon: Icon(Icons.add, size: 0), title: Text("")),
          BottomNavigationBarItem(
              icon: Icon(Icons.assessment), title: Text("Stats")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("Settings"))
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ActiveColors["colorPrimary"],
        unselectedItemColor: ActiveColors["fontNormal"],
        showUnselectedLabels: true,
        iconSize: 24,
        type: BottomNavigationBarType.fixed,
        onTap: onNavigationItemClicked,
      ),
    );
  }
}
