import 'package:flutter/material.dart';
import 'package:pocket_guard/ActiveColors.dart';
import 'package:pocket_guard/TransactionItemWidget.dart';
import 'package:pocket_guard/TransactionUiModel.dart';

class TransactionsScreen extends StatelessWidget {
  final List<TransactionUiModel> _uiList = [
    /// Dummy Data
    TransactionUiModel("Item1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", Icons.cake,
        DateTime.now(), 800000),
    TransactionUiModel("Item2", Icons.cake, DateTime.now(), -800),
    TransactionUiModel("Item3", Icons.cake, DateTime.now(), 1200),
    TransactionUiModel("Item4", Icons.cake, DateTime.now(), -8000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transactions"),
        backgroundColor: ActiveColors["colorPrimary"],
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return TransactionItemWidget(_uiList[index]);
          },
          itemCount: _uiList.length,
        ),
      ),
    );
  }
}
