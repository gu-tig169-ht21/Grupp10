// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:my_first_app/provider/pouch_provider.dart';
import 'package:provider/provider.dart';

class LineChartPrognos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PouchProvider>(
      builder: (context, state, child) => LineChart(LineChartData(
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.white10,
            tooltipRoundedRadius: 8,
          ),
        ),
        minX: 0,
        maxX: 30,
        minY: 0,
        maxY: _getProjected30YearMax(_calculateProjectedCost(state)),
        backgroundColor: const Color(0xff101010),
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(
            showTitles: true,
            getTextStyles: (context, value) =>
                const TextStyle(color: Colors.grey, fontSize: 11),
            margin: 8,
            reservedSize: 20,
          ),
          leftTitles: SideTitles(
            showTitles: true,
            margin: 8,
            reservedSize: 30,
            getTextStyles: (context, value) =>
                const TextStyle(color: Colors.grey, fontSize: 11),
          ),
          topTitles: SideTitles(showTitles: false),
          rightTitles: SideTitles(
            showTitles: false,
          ),
        ),
        gridData: FlGridData(
          show: false,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.grey,
              strokeWidth: 0.3,
            );
          },
          drawVerticalLine: true,
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Colors.grey,
              strokeWidth: 0.3,
            );
          },
        ),
        borderData: FlBorderData(
          show: false,
          border: Border.all(color: Colors.grey, width: 0.3),
        ),
        lineBarsData: [
          LineChartBarData(
            // börsen
            spots: _getProjected30YearGain(_calculateProjectedCost(state)),
            isCurved: true,
            barWidth: 3,
            colors: [Color(0xffffbe66)],
            dotData: FlDotData(show: false),
          ),
          LineChartBarData(
            // konsumtion
            spots: _getProjected30YearCost(_calculateProjectedCost(state)),
            isCurved: true,
            barWidth: 3,
            colors: [
              Color(0xff699985),
            ],
            dotData: FlDotData(show: false),
          ),
        ],
      )),
    );
  }

  List<FlSpot> _getProjected30YearCost(int projectedYearCost) {
    List<FlSpot> list = [];

    for (int i = 1; i <= 30; i++) {
      list.add(FlSpot(i.toDouble(), (projectedYearCost * i).toDouble()));
    }

    return list;
  }

  List<FlSpot> _getProjected30YearGain(int projectedYearCost) {
    List<FlSpot> list = [];

    for (int i = 1; i <= 30; i++) {
      double projectedGain = 0.0;

      for (int j = 1; j <= i; j++) {
        projectedGain = (projectedGain + projectedYearCost) * 1.07;
      }

      list.add(FlSpot(i.toDouble(), projectedGain.round().toDouble()));
    }

    return list;
  }

  double _getProjected30YearMax(int projectedYearCost) {
    double projectedMax = 0.0;

    for (int i = 1; i <= 30; i++) {
      projectedMax = (projectedMax + projectedYearCost) * 1.07;
    }

    projectedMax *= 1.2;

    return projectedMax;
  }

  int _calculateProjectedCost(PouchProvider state) {
    int currentYearCount = state.countYear;
    int price = state.selectedBox!.price;
    DateTime now = DateTime.now();
    DateTime firstDay = DateTime(now.year);
    DateTime firstDay2 = DateTime(now.year + 1);

    // inDays rundar ner, lägg till +1
    int dayOfYear = now.difference(firstDay).inDays + 1;

    double avgCount = currentYearCount / dayOfYear;

    int daysInYear = firstDay2.difference(firstDay).inDays;

    double projectedCount = avgCount * daysInYear;

    int projectedCost = (projectedCount * price).round();

    return projectedCost;
  }
}
