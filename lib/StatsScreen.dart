import 'package:flutter/material.dart';

import 'ActiveColors.dart';

class StatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Statistics"),
          backgroundColor: ActiveColors["colorPrimary"]),
      body: Center(child: Text("Stats Page")),
    );
  }
}
