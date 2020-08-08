import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:pocket_guard/ColorExtensions.dart';
import 'package:pocket_guard/DummyData.dart';
import 'package:pocket_guard/calendar/TitleSubtitleWidget.dart';

import 'ActiveColors.dart';
import 'StatsChartUiModel.dart';
import 'TransactionItemWidget.dart';

class StatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Statistics"),
            backgroundColor: ActiveColors["colorPrimary"]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// DURATION HEADER
              Card(
                elevation: 4,
                child: Container(
                  width: double.infinity,
                  height: 40,
                  color: ActiveColors["textFieldBackground"],
                  child: Center(
                    child: Text(
                      "STATS THIS WEEK",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: ActiveColors["colorPrimary"]),
                    ),
                  ),
                ),
              ),

              /// Price Blocks
              Padding(
                padding: EdgeInsets.fromLTRB(8, 12, 8, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TitleSubtitleWidget(
                          GradientBoxDecorator.fromGradient(
                              topColor: HexColor.fromHex("#AE62EC"),
                              bottomColor: HexColor.fromHex("#E0A6D8"),
                              angle: 90),
                          Text(
                            "Total\nTransaction",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          Text("\$800",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500))),
                    ),
                    Expanded(
                      child: TitleSubtitleWidget(
                        GradientBoxDecorator.fromGradient(
                            topColor: HexColor.fromHex("#FE918A"),
                            bottomColor: HexColor.fromHex("#FBBB8B"),
                            angle: 90),
                        Text("Total\nExpenses",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                        Text("\$800",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    Expanded(
                      child: TitleSubtitleWidget(
                        GradientBoxDecorator.fromGradient(
                            topColor: HexColor.fromHex("#46D1C1"),
                            bottomColor: HexColor.fromHex("#B1F1BC"),
                            angle: 90),
                        Text("Total\nIncome",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                        Text("\$800",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),

              /// Bar Graph
              Container(
                margin: EdgeInsets.only(top: 32),
                height: 200,
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: charts.BarChart(
                  [
                    charts.Series<StatsChartUiModel, String>(
                      id: 'Clicks',
                      domainFn: (StatsChartUiModel clickData, _) =>
                          clickData.date,
                      measureFn: (StatsChartUiModel clickData, _) =>
                          clickData.amount,
                      colorFn: (StatsChartUiModel clickData, _) =>
                          clickData.color,
                      labelAccessorFn: (StatsChartUiModel clickData, _) =>
                          clickData.amount.toString(),
                      data: DummyData.chartUiList,
                    ),
                  ],
                  animate: true,
                  barRendererDecorator: charts.BarLabelDecorator<String>(
                    labelPosition: charts.BarLabelPosition.outside,
                  ),
                ),
              ),
              ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return TransactionItemWidget(
                      DummyData.uiTransactionList[index]);
                },
                itemCount: DummyData.uiTransactionList.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
              ),
            ],
          ),
        ));
  }
}
