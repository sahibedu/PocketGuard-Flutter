import 'package:flutter/material.dart';
import 'package:pocket_guard/ActiveColors.dart';

class TransactionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transactions"),
        backgroundColor: ActiveColors["colorPrimary"],
      ),
      body: Center(child: Text("Transactions Page")),
    );
  }
}
