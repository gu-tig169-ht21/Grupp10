import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:my_first_app/provider/pouch_provider.dart';
import 'package:provider/provider.dart';
import 'dart:math';

//gör om till bar chart

class BarChartHistorik extends StatelessWidget {
  final List<Color> barcolor = [
    const Color(0xff699985),
    const Color(0xffbcbcbc),
  ];

  BarChartHistorik({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PouchProvider>(context, listen: false);
    double maxY = provider.weekList.reduce(max).toDouble() * 1.2;

    return BarChart(
      BarChartData(
        maxY: [25, maxY].reduce(max).toDouble(),
        minY: 0,
        groupsSpace: 10,
        barTouchData: BarTouchData(enabled: true),
        gridData: FlGridData(
          show: false,
        ),
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(
            showTitles: true,
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
            getTextStyles: (context, value) =>
                const TextStyle(color: Colors.grey, fontSize: 11),
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
              y: provider.weekList[0].toDouble(),
              width: 10,
              borderRadius: BorderRadius.circular(10),
            ),
          ]),
          BarChartGroupData(x: 2, barRods: [
            BarChartRodData(
              colors: barcolor,
              y: provider.weekList[1].toDouble(),
              width: 10,
              borderRadius: BorderRadius.circular(10),
            ),
          ]),
          BarChartGroupData(x: 3, barRods: [
            BarChartRodData(
              colors: barcolor,
              y: provider.weekList[2].toDouble(),
              width: 10,
              borderRadius: BorderRadius.circular(10),
            ),
          ]),
          BarChartGroupData(x: 4, barRods: [
            BarChartRodData(
              colors: barcolor,
              y: provider.weekList[3].toDouble(),
              width: 10,
              borderRadius: BorderRadius.circular(10),
            ),
          ]),
          BarChartGroupData(x: 5, barRods: [
            BarChartRodData(
              colors: barcolor,
              y: provider.weekList[4].toDouble(),
              width: 10,
              borderRadius: BorderRadius.circular(10),
            ),
          ]),
          BarChartGroupData(x: 6, barRods: [
            BarChartRodData(
              colors: barcolor,
              y: provider.weekList[5].toDouble(),
              width: 10,
              borderRadius: BorderRadius.circular(10),
            ),
          ]),
          BarChartGroupData(x: 7, barRods: [
            BarChartRodData(
              colors: barcolor,
              y: provider.weekList[6].toDouble(),
              width: 10,
              borderRadius: BorderRadius.circular(10),
            ),
          ])
        ],
      ),
    );
  }
}

BarChartGroupData _bar(int index, int count, List<Color> color) {
  return BarChartGroupData(x: index, barRods: [
    BarChartRodData(
      colors: color,
      y: count.toDouble(),
      width: 10,
      borderRadius: BorderRadius.circular(10),
    ),
  ]);
}
