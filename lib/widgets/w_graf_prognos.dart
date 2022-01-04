import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GrafPrognosWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
            minX: 0,
            maxX: 30,
            minY: 0,
            maxY: 80,
            backgroundColor: const Color(0xff111111),
            titlesData: FlTitlesData(
              bottomTitles: SideTitles(
                showTitles: true,
                getTextStyles: (context, value) =>
                    const TextStyle(color: Colors.grey, fontSize: 12),
                margin: 8,
                reservedSize: 20,
              ),
              leftTitles: SideTitles(
                showTitles: true,
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 20:
                      return '200k';
                    case 40:
                      return '400k';
                    case 60:
                      return '600k';
                    case 80:
                      return '800k';
                  }
                  return '';
                },
                margin: 8,
                reservedSize: 30,
                getTextStyles: (context, value) =>
                    const TextStyle(color: Colors.grey, fontSize: 12),
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
                spots: [
                  FlSpot(0, 0),
                  FlSpot(5, 4.5),
                  FlSpot(10, 10.8),
                  FlSpot(15, 19.6),
                  FlSpot(20, 32),
                  FlSpot(25, 49.4),
                  FlSpot(30, 73.7),
                ],
                isCurved: true,
                barWidth: 3,
                colors: [
                  Color(0xff699985),
                ],
              ),
              LineChartBarData(
                spots: [
                  FlSpot(0, 0),
                  FlSpot(5, 3.7),
                  FlSpot(10, 7.3),
                  FlSpot(15, 11),
                  FlSpot(20, 14.6),
                  FlSpot(25, 18.3),
                  FlSpot(30, 21.9),
                ],
                isCurved: true,
                barWidth: 3,
                colors: [
                  Color(0xffffbe66),
                ],
              )
            ]),
      );
}
