import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pocket_guard/DateTimeFormats.dart';
import 'package:pocket_guard/TextRadioGroup.dart';
import 'package:pocket_guard/TransactionUiModel.dart';

import 'ActiveColors.dart';

class AddTransactionScreen extends StatelessWidget {
  final int transactionId;

  // todo CHANGE WITH PRESENTATION MODEL
  TransactionUiModel _model;
  final amountController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  AddTransactionScreen(this.transactionId) {
    if (transactionId != null) {
      // todo fetch from db
      _model = TransactionUiModel(2, "Item2", "category2", Icons.cake,
          DateTime.now().subtract(Duration(days: 1)), -800);
      amountController.text = _model.amount.toString();
      titleController.text = _model.itemTitle;
      descriptionController.text = "blabla demo";
    } else
      _model = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              transactionId != null ? "Edit Transaction" : "Add Transaction"),
          backgroundColor: ActiveColors["colorPrimary"],
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextRadioGroup(
                          //todo set selected id
                          [
                            Text(
                              "Income",
                              style: TextStyle(
                                  color: Colors.white,
                                  backgroundColor: Colors.green),
                            ),
                            Text("Expense",
                                style: TextStyle(
                                    color: Colors.white,
                                    backgroundColor: Colors.red))
                          ],
                          EdgeInsets.all(12),
                          Colors.grey,
                          TextStyle(fontSize: 14, color: Colors.white),
                          4,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Date",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          child: Text(
                            DateTimeFormats.AddTransactionDateFormat.format(
                                _model != null
                                    ? (_model as TransactionUiModel).itemDate
                                    : DateTime.now()),
                            style: TextStyle(fontSize: 16),
                          ),
                          onTap: () {
                            // TODO OPEN CALENDAR PICKER SHEET
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Amount",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Spacer(),
                        Spacer(),
                        Expanded(
                          child: TextField(
                            controller: amountController,
                            maxLines: 1,
                            maxLength: 9,
                            textAlign: TextAlign.end,
                            textInputAction: TextInputAction.done,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefix: Text(
                                  "\$",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: ActiveColors["fontNormal"]),
                                ),
                                hintText: "0.00",
                                counterText: ""),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Category",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        DropdownButton<String>(
                          value: null,
                          onChanged: (String newValue) {
                            //TODO SET STATE
                          },
                          // TODO Selected Value
                          hint: Text(
                            _model != null ? _model.categoryName : "Item1",
                            style: TextStyle(color: Colors.black),
                          ),
                          // TODO ITEMS
                          items: ["category1", "category2"].map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.cake,
                                    size: 32,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Text(
                                      item,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Title *",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: titleController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Enter title (upto 25 characters)",
                                fillColor: ActiveColors["textFieldBackground"],
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)))),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: descriptionController,
                            maxLines: 5,
                            minLines: 5,
                            maxLength: 255,
                            onSubmitted: (String value) {
                              FocusScope.of(context).unfocus();
                            },
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                hintText: "Description (optional)",
                                fillColor: ActiveColors["textFieldBackground"],
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                          ),
                        )
                      ],
                    ),
                  ),
                  _model != null
                      ? Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Column(
                      children: [
                        Container(
                          height: 45,
                          width: double.infinity,
                          child: OutlineButton(
                            highlightElevation: 4,
                            highlightedBorderColor:
                            ActiveColors["colorPrimary"],
                            highlightColor:
                            ActiveColors["lightPrimaryColor"],
                            borderSide: BorderSide(color: Colors.black),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                new BorderRadius.circular(8)),
                            onPressed: () {},
                            child: Text(
                              "Update",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16, bottom: 16),
                          width: double.infinity,
                          height: 45,
                          child: OutlineButton(
                            highlightElevation: 4,
                            highlightedBorderColor:
                            ActiveColors["colorPrimary"],
                            highlightColor:
                            ActiveColors["lightPrimaryColor"],
                            borderSide: BorderSide(color: Colors.black),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                new BorderRadius.circular(8)),
                            onPressed: () {},
                            child: Text(
                              "Delete",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                      : Container()
                ],
              )),
        ),
        floatingActionButton: _model != null
            ? null
            : FloatingActionButton(
          backgroundColor: ActiveColors["colorAccent"],
          onPressed: () {
            // TODO SAVE DATA TO DB
            Navigator.pop(context);
          },
          child: Icon(Icons.done),
        ));
  }
}
