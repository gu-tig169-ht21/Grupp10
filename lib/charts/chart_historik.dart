import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import '/provider/pouch_provider.dart';

//gör om till bar chart

class BarChartHistorik extends StatelessWidget {
  final List<Color> barcolor = [
    const Color(0xff699985),
    const Color(0xffbcbcbc),
  ];

  BarChartHistorik({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PouchProvider>(
      builder: (context, state, child) => BarChart(
        BarChartData(
          maxY: _getMaxY(state.weekList),
          minY: 0,
          groupsSpace: 10,
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Colors.white10,
              tooltipRoundedRadius: 10,
              getTooltipItem: (group, groupIndex, rod, rodIndex) =>
                  BarTooltipItem('${rod.y.toInt()} prillor',
                      TextStyle(color: rod.colors[0])),
            ),
          ),
          gridData: FlGridData(
            show: false,
          ),
          titlesData: FlTitlesData(
            bottomTitles: SideTitles(
              showTitles: true,
              getTitles: _getTiles,
              getTextStyles: (context, value) =>
                  const TextStyle(color: Colors.grey, fontSize: 11),
              margin: 8,
              reservedSize: 20,
            ),
            leftTitles: SideTitles(
              showTitles: true,
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
          barGroups: _getBarList(state.weekList, barcolor),
        ),
      ),
    );
  }
}

List<BarChartGroupData> _getBarList(List<int> list, List<Color> barcolor) {
  List<BarChartGroupData> newlist = [];

  list.asMap().forEach((index, value) {
    newlist.add(_bar(index + 1, value, barcolor));
  });

  return newlist;
}

double _getMaxY(List<int> list) {
  double maxY = 25.0;
  double highestCount;

  highestCount = list.reduce(max).toDouble();

  if (highestCount > maxY) {
    maxY = highestCount * 1.2;
  }

  return maxY;
}

String _getTiles(double d) {
  switch (d.toInt()) {
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
}

BarChartGroupData _bar(int index, int count, List<Color> color) {
  return BarChartGroupData(x: index, barRods: [
    BarChartRodData(
      colors: color,
      y: count.toDouble(),
      width: 10,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
  ]);
}
