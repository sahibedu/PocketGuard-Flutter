import 'package:flutter/material.dart';
import 'package:pocket_guard/calendar/CalendarUiModel.dart';

import '../ActiveColors.dart';
import '../DummyData.dart';
import '../TransactionItemWidget.dart';

class CalendarScreen extends StatelessWidget {
  final List _uiList = [
    /// Dummy Data
    CalendarUiModel(),
  ];

  CalendarScreen() {
    _uiList.addAll(DummyData.uiTransactionList);
  }

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
