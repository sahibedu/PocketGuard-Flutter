import 'package:flutter/material.dart';

import 'ActiveColors.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
        backgroundColor: ActiveColors["colorPrimary"],
      ),
      body: Center(child: Text("Calendar Page")),
    );
  }
}
