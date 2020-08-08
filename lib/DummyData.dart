import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:pocket_guard/StatsChartUiModel.dart';

import 'TransactionUiModel.dart';

class DummyData {
  static List<TransactionUiModel> uiTransactionList = [
    /// Dummy Data
    TransactionUiModel(1, "Item1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "category1",
        Icons.cake, DateTime.now(), 800000),
    TransactionUiModel(2, "Item2", "category2", Icons.cake,
        DateTime.now().subtract(Duration(days: 1)), -800),
    TransactionUiModel(
        3, "Item3", "category1", Icons.cake, DateTime.now(), 1200),
    TransactionUiModel(
        4, "Item4", "category2", Icons.cake, DateTime.now(), -8000),
    TransactionUiModel(
        5, "Item5", "category2", Icons.cake, DateTime.now(), -8000),
  ];

  static List<StatsChartUiModel> chartUiList = [
    StatsChartUiModel('03/08', 500, Color.fromHex(code: "#967ADC")),
    StatsChartUiModel('04/08', 200, Color.fromHex(code: "#967ADC")),
    StatsChartUiModel('05/08', 300, Color.fromHex(code: "#967ADC")),
    StatsChartUiModel('06/08', 400, Color.fromHex(code: "#967ADC")),
    StatsChartUiModel('07/08', 00, Color.fromHex(code: "#967ADC")),
    StatsChartUiModel('08/08', 100, Color.fromHex(code: "#967ADC")),
  ];
}
