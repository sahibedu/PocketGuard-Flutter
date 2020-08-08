import 'package:flutter/material.dart';

class TransactionUiModel {
  final int transactionId;
  final String itemTitle;
  final IconData categoryIcon;
  final String categoryName;
  final DateTime itemDate;
  final double amount;

  TransactionUiModel(this.transactionId, this.itemTitle, this.categoryName,
      this.categoryIcon, this.itemDate, this.amount)
      : assert(itemTitle != null),
        assert(categoryIcon != null),
        assert(itemDate != null),
        assert(amount != null),
        assert(transactionId != null);
}
