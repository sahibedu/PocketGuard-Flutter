import 'package:charts_flutter/flutter.dart' as charts;

class StatsChartUiModel {
  final String date;
  final int amount;
  final charts.Color color;

  StatsChartUiModel(this.date, this.amount, this.color);
}
