import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GrafHistorikWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
            minX: 1,
            maxX: 7,
            minY: 0,
            maxY: 20,
            backgroundColor: const Color(0xff111111),
            titlesData: FlTitlesData(
              bottomTitles: SideTitles(
                showTitles: true,
                getTextStyles: (context, value) =>
                    const TextStyle(color: Colors.grey, fontSize: 12),
                margin: 8,
                reservedSize: 20,
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 1:
                      return 'Mån';
                    case 2:
                      return 'Tis';
                    case 3:
                      return 'Ons';
                    case 4:
                      return 'Tors';
                    case 5:
                      return 'Fre';
                    case 6:
                      return 'Lör';
                    case 7:
                      return 'Sön';
                  }
                  return '';
                },
              ),
              leftTitles: SideTitles(
                showTitles: true,
                /*getTitles: (value) {
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
                },*/
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
                  FlSpot(1, 10),
                  FlSpot(2, 8),
                  FlSpot(3, 11),
                  FlSpot(4, 15),
                  FlSpot(5, 9),
                  FlSpot(6, 4),
                  FlSpot(7, 10),
                  /*  FlSpot(8, 9),
                  FlSpot(9, 13),
                  FlSpot(10, 14),
                  FlSpot(11, 18),
                  FlSpot(12, 21),
                  FlSpot(13, 14),
                  FlSpot(14, 18),
                  FlSpot(15, 21),
                  FlSpot(16, 13),
                  FlSpot(17, 7),
                  FlSpot(18, 7),
                  FlSpot(19, 11),
                  FlSpot(20, 14),
                  FlSpot(21, 18),
                  FlSpot(22, 21),
                  FlSpot(23, 14),
                  FlSpot(24, 18),
                  FlSpot(25, 21),
                  FlSpot(26, 14),
                  FlSpot(27, 18),
                  FlSpot(28, 21),
                  FlSpot(29, 14),
                  FlSpot(30, 18),
                  FlSpot(31, 21),
                  */
                ],
                isCurved: true,
                barWidth: 3,
                colors: [
                  Color(0xff699985),
                ],
              )
            ]),
      );
}
