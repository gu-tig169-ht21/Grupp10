import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

//gör om till bar chart

class BarChartHistorik extends StatelessWidget {
  final List<Color> barcolor = [
    const Color(0xff699985),
  ];
  @override
  Widget build(BuildContext context) => BarChart(
        BarChartData(
          maxY: 20,
          minY: 0,
          groupsSpace: 10,
          barTouchData: BarTouchData(enabled: true),
          gridData: FlGridData(
            show: false,
          ),
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
              //margin: 8,
              reservedSize: 30,
              getTextStyles: (context, value) =>
                  const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            topTitles: SideTitles(showTitles: false),
            rightTitles: SideTitles(
              showTitles: false,
            ),
          ),
          borderData: FlBorderData(show: false),
          barGroups: [
            BarChartGroupData(x: 1, barRods: [
              BarChartRodData(
                colors: barcolor,
                y: 11,
                width: 10,
                borderRadius: BorderRadius.circular(10),
              ),
            ]),
            BarChartGroupData(x: 2, barRods: [
              BarChartRodData(
                colors: barcolor,
                y: 7,
                width: 10,
                borderRadius: BorderRadius.circular(10),
              ),
            ]),
            BarChartGroupData(x: 3, barRods: [
              BarChartRodData(
                colors: barcolor,
                y: 14,
                width: 10,
                borderRadius: BorderRadius.circular(10),
              ),
            ]),
            BarChartGroupData(x: 4, barRods: [
              BarChartRodData(
                colors: barcolor,
                y: 10,
                width: 10,
                borderRadius: BorderRadius.circular(10),
              ),
            ]),
            BarChartGroupData(x: 5, barRods: [
              BarChartRodData(
                colors: barcolor,
                y: 16,
                width: 10,
                borderRadius: BorderRadius.circular(10),
              ),
            ]),
            BarChartGroupData(x: 6, barRods: [
              BarChartRodData(
                colors: barcolor,
                y: 8,
                width: 10,
                borderRadius: BorderRadius.circular(10),
              ),
            ]),
            BarChartGroupData(x: 7, barRods: [
              BarChartRodData(
                colors: barcolor,
                y: 13,
                width: 10,
                borderRadius: BorderRadius.circular(10),
              ),
            ])
          ],
        ),
      );
}
