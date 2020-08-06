import 'package:flutter/material.dart';
import 'package:pocket_guard/calendar/CalendarUiModel.dart';

import '../ActiveColors.dart';
import '../TransactionItemWidget.dart';
import '../TransactionUiModel.dart';

class CalendarScreen extends StatelessWidget {
  final List _uiList = [
    /// Dummy Data
    CalendarUiModel(),
    TransactionUiModel("Item1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", Icons.cake,
        DateTime.now(), 800000),
    TransactionUiModel("Item2", Icons.cake, DateTime.now(), -800),
    TransactionUiModel("Item3", Icons.cake, DateTime.now(), 1200),
    TransactionUiModel("Item4", Icons.cake, DateTime.now(), -8000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
        backgroundColor: ActiveColors["colorPrimary"],
      ),
      body: Container(
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            if (_uiList[index] is CalendarUiModel) {
              return (_uiList[index] as CalendarUiModel).getViewType();
            }
            return TransactionItemWidget(_uiList[index]);
          },
          itemCount: _uiList.length,
        ),
      ),
    );
  }
}
