import 'package:flutter/material.dart';

class TransactionUiModel {
  final String itemTitle;
  final IconData categoryIcon;
  final DateTime itemDate;
  final double amount;

  TransactionUiModel(
      this.itemTitle, this.categoryIcon, this.itemDate, this.amount)
      : assert(itemTitle != null),
        assert(categoryIcon != null),
        assert(itemDate != null),
        assert(amount != null);
}
