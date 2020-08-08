import 'package:flutter/material.dart';

import 'ActiveColors.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: ActiveColors["colorPrimary"],
      ),
      body: Center(
          child: Text(
        "Build with ♥️ from AppNikks",
        style: TextStyle(
            color: Colors.red, fontWeight: FontWeight.w500, fontSize: 16),
      )),
    );
  }
}
