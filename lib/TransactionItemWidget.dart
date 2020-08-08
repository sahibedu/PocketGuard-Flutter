import 'package:flutter/material.dart';
import 'package:pocket_guard/ActiveColors.dart';
import 'package:pocket_guard/EditTransactionScreen.dart';
import 'package:pocket_guard/TransactionUiModel.dart';

class TransactionItemWidget extends StatelessWidget {
  final TransactionUiModel model;

  TransactionItemWidget(this.model) : assert(model != null);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ActiveColors,
      child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return EditTransactionScreen(model.transactionId);
            }));
          },
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Icon(
                  model.categoryIcon,
                  size: 48,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(12, 0, 8, 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                            model.itemTitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              model.itemDate.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: ActiveColors["fontLight"],
                                  fontSize: 12),
                            )),
                      ],
                    ),
                  ),
                ),
                Text(
                  model.amount.toString(),
                  style: TextStyle(
                      fontSize: 14,
                      color: model.amount > 0 ? Colors.green : Colors.red),
                )
              ],
            ),
          )),
    );
  }
}
