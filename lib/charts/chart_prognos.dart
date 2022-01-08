// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartPrognos extends StatelessWidget {
  @override
  Widget build(BuildContext context) => LineChart(LineChartData(
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.white10,
            tooltipRoundedRadius: 8,
          ),
        ),
        minX: 0,
        maxX: 30,
        minY: 0,
        maxY: 800000,
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
            // börsen
            spots: [
              FlSpot(0, 0),
              FlSpot(1, 7807),
              FlSpot(2, 16160),
              FlSpot(3, 25098),
              FlSpot(4, 34661),
              FlSpot(5, 44894),
              FlSpot(6, 55844),
              FlSpot(7, 67560),
              FlSpot(8, 80095),
              FlSpot(9, 93509),
              FlSpot(10, 107861),
              FlSpot(11, 123218),
              FlSpot(12, 139650),
              FlSpot(13, 157232),
              FlSpot(14, 176045),
              FlSpot(15, 196175),
              FlSpot(16, 217714),
              FlSpot(17, 240761),
              FlSpot(18, 265421),
              FlSpot(19, 291807),
              FlSpot(20, 320040),
              FlSpot(25, 493768),
              FlSpot(30, 737429),
            ],
            isCurved: true,
            barWidth: 3,
            colors: [Color(0xffffbe66)],
            dotData: FlDotData(show: false),
          ),
          LineChartBarData(
            // konsumtion
            spots: [
              FlSpot(0, 0),
              FlSpot(5, 36500),
              FlSpot(10, 73000),
              FlSpot(15, 109500),
              FlSpot(20, 146000),
              FlSpot(25, 182500),
              FlSpot(30, 219000),
            ],
            isCurved: true,
            barWidth: 3,
            colors: [
              Color(0xff699985),
            ],
            dotData: FlDotData(show: false),
          ),
        ],
      ));
}
