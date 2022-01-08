// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';
import '../charts/chart_historik.dart';

class MyHistorikPage extends StatefulWidget {
  const MyHistorikPage({Key? key}) : super(key: key);

  @override
  MyHistorikPageState createState() => MyHistorikPageState();
}

class MyHistorikPageState extends State<MyHistorikPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView(
      padding: const EdgeInsets.all(10),
      children: [
        _graf(),
        // Container(height: 15),
        Row(
          children: [
            Text('FÖRRA VECKAN',
                style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey)),
          ],
        ),
        _lastWeek(MyHomePageState.weeklyPrillaOnScreenDisplay),
        Container(height: 10),
        Row(
          children: [
            Text('FÖRRA MÅNADEN',
                style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey)),
          ],
        ),
        _lastMonth(MyHomePageState.monthlyPrillaOnScreenDisplay),
        Container(height: 10),
        Row(
          children: [
            Text('FÖRRA ÅRET',
                style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey)),
          ],
        ),
        _lastYear(),
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
              // elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              color: const Color(0xff111111),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 15, 0),
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
        color: const Color(0xff282828),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
          Widget>[
        Column(children: [
          Text('0', style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('kr', style: TextStyle(fontSize: 12, color: Colors.white)),
        ]),
        Column(children: const [
          Text('0', style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('dosor', style: TextStyle(fontSize: 12, color: Colors.white)),
        ]),
        Column(children: [
          Text('$weeklyPrillaOnScreenDisplay',
              style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('prillor', style: TextStyle(fontSize: 12, color: Colors.white)),
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
        color: const Color(0xff282828),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
          Widget>[
        Column(children: const [
          Text('0', style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('kr', style: TextStyle(fontSize: 12, color: Colors.white)),
        ]),
        Column(children: const [
          Text('0', style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('dosor', style: TextStyle(fontSize: 12, color: Colors.white)),
        ]),
        Column(children: [
          Text('$monthlyPrillaOnScreenDisplay',
              style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('prillor', style: TextStyle(fontSize: 12, color: Colors.white)),
        ])
      ]));
}

_lastYear() {
  return Container(
      padding: const EdgeInsets.fromLTRB(60, 30, 60, 20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color(0xff282828),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
          Widget>[
        Column(children: const [
          Text('0', style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('kr', style: TextStyle(fontSize: 12, color: Colors.white)),
        ]),
        Column(children: const [
          Text('0', style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('dosor', style: TextStyle(fontSize: 12, color: Colors.white)),
        ]),
        Column(children: const [
          Text('0', style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('prillor', style: TextStyle(fontSize: 12, color: Colors.white)),
        ])
      ]));
}
