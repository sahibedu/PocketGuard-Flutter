import 'package:flutter/material.dart';
import 'package:pocket_guard/ActiveColors.dart';
import 'package:pocket_guard/DummyData.dart';
import 'package:pocket_guard/TransactionItemWidget.dart';

class TransactionsScreen extends StatelessWidget {

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
            return TransactionItemWidget(DummyData.uiTransactionList[index]);
          },
          itemCount: DummyData.uiTransactionList.length,
        ),
      ),
    );
  }
}
