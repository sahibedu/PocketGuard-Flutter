import 'package:flutter/material.dart';

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
  ];
}
