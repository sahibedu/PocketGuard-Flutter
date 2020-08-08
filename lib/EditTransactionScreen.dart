import 'package:flutter/cupertino.dart';
import 'package:pocket_guard/AddTransactionScreen.dart';

class EditTransactionScreen extends StatelessWidget {
  final int transactionId;

  EditTransactionScreen(this.transactionId) : assert(transactionId != null);

  @override
  Widget build(BuildContext context) {
    return AddTransactionScreen(transactionId);
  }
}
