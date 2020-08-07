import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pocket_guard/DateTimeFormats.dart';
import 'package:pocket_guard/TextRadioGroup.dart';

import 'ActiveColors.dart';

class AddTransactionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Transaction"),
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
                                DateTime.now()),
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
                            "Item1",
                            style: TextStyle(color: Colors.black),
                          ),
                          // TODO ITEMS
                          items: ["Item1", "Item2"].map((String item) {
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
                            maxLines: 5,
                            minLines: 5,
                            keyboardType: TextInputType.text,
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
                  )
                ],
              )),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ActiveColors["colorAccent"],
          onPressed: () {
            // TODO SAVE DATA TO DB
            Navigator.pop(context);
          },
          child: Icon(Icons.done),
        ));
  }
}
