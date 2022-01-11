import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

//gör om till bar chart

class BarChartHistorik extends StatelessWidget {
  final List<Color> barcolor = [
    const Color(0xff699985),
  ];
  final List<Color> otherbarcolor = [
    const Color(0xffbcbcbc),
  ];
  @override
  Widget build(BuildContext context) => BarChart(
        BarChartData(
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Colors.white10,
              tooltipRoundedRadius: 8,
            ),
          ),
          maxY: 20,
          minY: 0,
          groupsSpace: 10,
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
                  const TextStyle(color: Colors.grey, fontSize: 11),
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
                colors: otherbarcolor,
                y: 4,
                width: 10,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              BarChartRodData(
                colors: barcolor,
                y: 11,
                width: 10,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
            ]),
            BarChartGroupData(x: 2, barRods: [
              BarChartRodData(
                colors: otherbarcolor,
                y: 7,
                width: 10,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              BarChartRodData(
                colors: barcolor,
                y: 6,
                width: 10,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
            ]),
            BarChartGroupData(x: 3, barRods: [
              BarChartRodData(
                colors: otherbarcolor,
                y: 14,
                width: 10,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              BarChartRodData(
                colors: barcolor,
                y: 17,
                width: 10,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
            ]),
            BarChartGroupData(x: 4, barRods: [
              BarChartRodData(
                colors: otherbarcolor,
                y: 14,
                width: 10,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              BarChartRodData(
                colors: barcolor,
                y: 8,
                width: 10,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
            ]),
            BarChartGroupData(x: 5, barRods: [
              BarChartRodData(
                colors: otherbarcolor,
                y: 14,
                width: 10,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              BarChartRodData(
                colors: barcolor,
                y: 16,
                width: 10,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
            ]),
            BarChartGroupData(x: 6, barRods: [
              BarChartRodData(
                colors: otherbarcolor,
                y: 13,
                width: 10,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              BarChartRodData(
                colors: barcolor,
                y: 8,
                width: 10,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
            ]),
            BarChartGroupData(x: 7, barRods: [
              BarChartRodData(
                colors: otherbarcolor,
                y: 9,
                width: 10,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              BarChartRodData(
                colors: barcolor,
                y: 13,
                width: 10,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
            ])
          ],
        ),
      );
}
