// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';
import '../charts/chart_historik.dart';

class MyHistorikPage extends StatefulWidget {
  MyHistorikPage(
      this.firstHistorikWidgetBuild, this.setFirstHistorikWidgetBuild);
  bool firstHistorikWidgetBuild;
  Function setFirstHistorikWidgetBuild;

  @override
  MyHistorikPageState createState() => MyHistorikPageState();
}

class MyHistorikPageState extends State<MyHistorikPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  /* void dispose() {
//record time of leaving
    MyHomePageState.abc = DateTime.now();
    super.dispose();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView(
      padding: const EdgeInsets.all(10),
      children: [
        _graf(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.circle, color: Color(0xffbcbcbc), size: 10),
            Text(' Förra veckan eller genomsnitt?',
                style: TextStyle(color: Colors.white, fontSize: 11)),
            SizedBox(width: 15),
            Icon(Icons.circle, color: Color(0xff699985), size: 10),
            Text(' Denna vecka',
                style: TextStyle(color: Colors.white, fontSize: 12))
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Text('FÖRRA VECKAN',
                style: GoogleFonts.raleway(fontSize: 12, color: Colors.grey)),
          ],
        ),
        _lastWeek(MyHomePageState.weeklyPrillaOnScreenDisplay),
        Container(height: 10),
        Row(
          children: [
            Text('FÖRRA MÅNADEN',
                style: GoogleFonts.raleway(fontSize: 12, color: Colors.grey)),
          ],
        ),
        _lastMonth(MyHomePageState.monthlyPrillaOnScreenDisplay),
        Container(height: 10),
        Row(
          children: [
            Text('FÖRRA ÅRET',
                style: GoogleFonts.raleway(fontSize: 12, color: Colors.grey)),
          ],
        ),
        _lastYear(MyHomePageState.yearlyPrillaOnScreenDisplay),
      ],
    )));
  }
}

Widget _graf() {
  return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: double.infinity,
            height: 250,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              color: const Color(0xff101010),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 25, 25, 5),
                child: BarChartHistorik(),
              ),
            ),
          )));
}

Widget _lastWeek(weeklyPrillaOnScreenDisplay) {
  return Container(
      padding: const EdgeInsets.fromLTRB(60, 30, 60, 20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color(0xff1c1c1c),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
          Widget>[
        Column(children: [
          Text('0', style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('kr', style: TextStyle(fontSize: 11, color: Colors.white)),
        ]),
        Column(children: const [
          Text('0', style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('dosor', style: TextStyle(fontSize: 11, color: Colors.white)),
        ]),
        Column(children: [
          Text('$weeklyPrillaOnScreenDisplay',
              style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('prillor', style: TextStyle(fontSize: 11, color: Colors.white)),
        ])
      ]));
}

_lastMonth(monthlyPrillaOnScreenDisplay) {
  return Container(
      padding: const EdgeInsets.fromLTRB(60, 30, 60, 20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color(0xff1c1c1c),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
          Widget>[
        Column(children: const [
          Text('0', style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('kr', style: TextStyle(fontSize: 11, color: Colors.white)),
        ]),
        Column(children: const [
          Text('0', style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('dosor', style: TextStyle(fontSize: 11, color: Colors.white)),
        ]),
        Column(children: [
          Text('$monthlyPrillaOnScreenDisplay',
              style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('prillor', style: TextStyle(fontSize: 11, color: Colors.white)),
        ])
      ]));
}

_lastYear(yearlyPrillaOnScreenDisplay) {
  return Container(
      padding: const EdgeInsets.fromLTRB(60, 30, 60, 20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color(0xff1c1c1c),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
          Widget>[
        Column(children: const [
          Text('0', style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('kr', style: TextStyle(fontSize: 11, color: Colors.white)),
        ]),
        Column(children: const [
          Text('0', style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('dosor', style: TextStyle(fontSize: 11, color: Colors.white)),
        ]),
        Column(children: [
          Text('$yearlyPrillaOnScreenDisplay',
              style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('prillor', style: TextStyle(fontSize: 11, color: Colors.white)),
        ])
      ]));
}
