import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/widgets/w_graf_historik.dart';
import 'dart:async';
import './home.dart';
import 'ny_produkt.dart';

class MyHistorikPage extends StatefulWidget {
  const MyHistorikPage({Key? key}) : super(key: key);

  @override
  MyHistorikPageState createState() => MyHistorikPageState();
}

class MyHistorikPageState extends State<MyHistorikPage> {
  static int senasteVeckanPrillor = 0;
  DateTime historikPageAccessTime = DateTime.now();
  var oldNewDiff = 0; //move up state

  static var weeklyPrillaCounter = 0;
  static var monthlyPrillaCounter = 0;
  static var yearlyPrillaCounter = 0;

  var weeklyPrillaOnScreenDisplay = 0;
  var monthlyPrillaOnScreenDisplay = 0;

  var abc = DateTime(2022, 8, 30, 13, 20, 10);

  //retrieve daily monthly yearly from database

  @override
  void initState() {
    super.initState();

    if (MyHomePageState.firstHistorikWidgetBuild) {
      oldNewDiff = historikPageAccessTime.difference(abc).inSeconds;

      //time from database and new time

      MyHomePageState.setFirstHistorikWidgetBuild();
      print('1');
    } else {
      print('$historikPageAccessTime');
      print('${MyHomePageState.historikPageLeaveTime}');

      oldNewDiff = historikPageAccessTime
          .difference(MyHomePageState.historikPageLeaveTime)
          .inSeconds;

      print('weekTimer before OldDiff thng ${MyHomePageState.weekTimer}');

      MyHomePageState.weekTimer += oldNewDiff;
      MyHomePageState.monthTimer += oldNewDiff;
      print('2');
    }

    //firstappinitlogic vs not
    //when app starts, newtimeregistered when page is accesed, oldtime is retrieved from database

    //weektimer and month timer = x? if seconds = 22223434 reset new, if 569999999m reset month

    Timer.periodic(Duration(seconds: 1), (timer) {
      print('weektimer is ${MyHomePageState.weekTimer}');
      if (MyHomePageState.weekTimer >= 10) {
        //604800
        setState(() {
          weeklyPrillaOnScreenDisplay = weeklyPrillaCounter;
          weeklyPrillaCounter = 0;
          MyHomePageState.weekTimer = 0;
        });
      }

      if (MyHomePageState.monthTimer >= 40) {
        //604800
        setState(() {
          monthlyPrillaOnScreenDisplay = monthlyPrillaCounter;
          monthlyPrillaCounter = 0;
          MyHomePageState.monthTimer = 0;
        });
      }

      MyHomePageState.weekTimer++;
      MyHomePageState.monthTimer++;

      if (!mounted) {
        //record time of leaving
        MyHomePageState.recordHistorikPageLeaveTime(DateTime.now());
        print('mounted record time was ${DateTime.now()}');
        timer.cancel();
      }
    });

    print('weekly display $weeklyPrillaOnScreenDisplay');
  }

  @override
  Widget build(BuildContext context) {
    print('im called');
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
        _lastWeek(weeklyPrillaOnScreenDisplay),
        Container(height: 10),
        Row(
          children: [
            Text('FÖRRA MÅNADEN',
                style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey)),
          ],
        ),
        _lastMonth(monthlyPrillaOnScreenDisplay),
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
                padding: const EdgeInsets.fromLTRB(5, 25, 25, 5),
                child: GrafHistorikWidget(),
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
