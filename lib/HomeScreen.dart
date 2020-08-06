import 'package:flutter/material.dart';
import 'package:pocket_guard/ActiveColors.dart';
import 'package:pocket_guard/SettingsScreen.dart';
import 'package:pocket_guard/StatsScreen.dart';
import 'package:pocket_guard/TransactionsScreen.dart';
import 'package:pocket_guard/calendar/CalendarScreen.dart';

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
  Widget _screenToShow = TransactionsScreen();

  void onNavigationItemClicked(int index) {
    setState(() {
      if (index != 2) {
        _selectedIndex = index;
        switch (index) {
          case 0:
            {
              _screenToShow = TransactionsScreen();
              break;
            }
          case 1:
            {
              _screenToShow = CalendarScreen();
              break;
            }
          case 3:
            {
              _screenToShow = StatsScreen();
              break;
            }
          case 4:
            {
              _screenToShow = SettingsScreen();
              break;
            }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenToShow,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ActiveColors["colorAccent"],
        child: Icon(
          Icons.add,
          size: 24,
        ),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          BottomNavigationBar(
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
        ],
      ),
    );
  }
}
