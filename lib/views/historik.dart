// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/provider/pouch_provider.dart';
import 'package:provider/provider.dart';

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
    var provider = Provider.of<PouchProvider>(context, listen: false);
    Future.delayed(Duration.zero, () => provider.getWeekList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Consumer<PouchProvider>(builder: (context, state, child) => _graf()),
        // Container(height: 15),
        Row(
          children: [
            Text('FÖRRA VECKAN',
                style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey)),
          ],
        ),
        _lastWeek(context),
        Container(height: 10),
        Row(
          children: [
            Text('FÖRRA MÅNADEN',
                style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey)),
          ],
        ),
        _lastMonth(context),
        Container(height: 10),
        Row(
          children: [
            Text('FÖRRA ÅRET',
                style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey)),
          ],
        ),
        _lastYear(context),
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

Widget _lastWeek(context) {
  var provider = Provider.of<PouchProvider>(context, listen: false);
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
          Text('${provider.countWeek * provider.selectedBox!.price}',
              style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('kr', style: TextStyle(fontSize: 12, color: Colors.white)),
        ]),
        Column(children: [
          Text('${(provider.countWeek ~/ 21)}',
              style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('dosor', style: TextStyle(fontSize: 12, color: Colors.white)),
        ]),
        Column(children: [
          Text(
              '${Provider.of<PouchProvider>(context, listen: false).countWeek}',
              style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('prillor', style: TextStyle(fontSize: 12, color: Colors.white)),
        ])
      ]));
}

_lastMonth(context) {
  var provider = Provider.of<PouchProvider>(context, listen: false);
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
          Text('${provider.countMonth * provider.selectedBox!.price}',
              style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('kr', style: TextStyle(fontSize: 12, color: Colors.white)),
        ]),
        Column(children: [
          Text('${provider.countMonth ~/ 21}',
              style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('dosor', style: TextStyle(fontSize: 12, color: Colors.white)),
        ]),
        Column(children: [
          Text('${provider.countMonth}',
              style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('prillor', style: TextStyle(fontSize: 12, color: Colors.white)),
        ])
      ]));
}

_lastYear(context) {
  var provider = Provider.of<PouchProvider>(context, listen: false);
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
          Text('${provider.countYear * provider.selectedBox!.price}',
              style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('kr', style: TextStyle(fontSize: 12, color: Colors.white)),
        ]),
        Column(children: [
          Text('${provider.countYear ~/ 21}',
              style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('dosor', style: TextStyle(fontSize: 12, color: Colors.white)),
        ]),
        Column(children: [
          Text('${provider.countYear}',
              style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('prillor', style: TextStyle(fontSize: 12, color: Colors.white)),
        ])
      ]));
}
