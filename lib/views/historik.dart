import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/widgets/w_graf_historik.dart';
import 'dart:async';
import './home.dart';
import 'ny_produkt.dart';

class MyHistorikPage extends StatefulWidget {
  MyHistorikPage(
      this.firstHistorikWidgetBuild, this.setFirstHistorikWidgetBuild);
  bool firstHistorikWidgetBuild;
  Function setFirstHistorikWidgetBuild;

  @override
  MyHistorikPageState createState() => MyHistorikPageState();
}

class MyHistorikPageState extends State<MyHistorikPage> {
  DateTime historikPageAccessTime = DateTime.now();
  var oldNewDiff = 0; //move up state

  static var weeklyPrillaCounter = 0;
  static var monthlyPrillaCounter = 0;
  static var yearlyPrillaCounter = 0;

  var clock;

  //retrieve daily monthly yearly from database

  @override
  void initState() {
    super.initState();

    oldNewDiff =
        historikPageAccessTime.difference(MyHomePageState.abc).inSeconds;

    print(oldNewDiff);

    //time from database and new time

    MyHomePageState.weekTimer += oldNewDiff;
    MyHomePageState.monthTimer += oldNewDiff;
    MyHomePageState.yearTimer += oldNewDiff;

    print('${MyHomePageState.weekTimer}');
    print('${MyHomePageState.monthTimer}');
    print('${MyHomePageState.yearTimer}');

    //firstappinitlogic vs not
    //when app starts, newtimeregistered when page is accesed, oldtime is retrieved from database

    //weektimer and month timer = x? if seconds = 22223434 reset new, if 569999999m reset month

    var w = MyHomePageState.weekTimer % 10;
    var t = MyHomePageState.monthTimer % 40;
    var y = MyHomePageState.yearTimer % 80;

    if (w == 0) {
      //604 800
      //604800
      setState(() {
        MyHomePageState.weeklyPrillaOnScreenDisplay = weeklyPrillaCounter;
        weeklyPrillaCounter = 0;
      });
    }

    //fi week timer is between week and month

    //om weektimer 10, old new diff 3

    if (t == 0) {
      //604800
      setState(() {
        MyHomePageState.monthlyPrillaOnScreenDisplay = monthlyPrillaCounter;
        monthlyPrillaCounter = 0;
      });
    }

    if (y == 0) {
      //604800
      setState(() {
        MyHomePageState.yearlyPrillaOnScreenDisplay = yearlyPrillaCounter;
        yearlyPrillaCounter = 0;
      });
    }

    clock = Timer.periodic(Duration(seconds: 1), (timer) {
      MyHomePageState.weekTimer++;
      MyHomePageState.monthTimer++;
      MyHomePageState.yearTimer++;

      var w = MyHomePageState.weekTimer % 10;
      var t = MyHomePageState.monthTimer % 40;
      var y = MyHomePageState.yearTimer % 80;

      print('weektimer is ${MyHomePageState.weekTimer % 10}');
      print('monthtimer is ${MyHomePageState.monthTimer % 40}');
      print('yeartimer is ${MyHomePageState.yearTimer % 80}');

      if (w == 0) {
        //604 800
        //604800
        setState(() {
          MyHomePageState.weeklyPrillaOnScreenDisplay = weeklyPrillaCounter;
          weeklyPrillaCounter = 0;
        });
      }

      if (t == 0) {
        //604800
        setState(() {
          MyHomePageState.monthlyPrillaOnScreenDisplay = monthlyPrillaCounter;
          monthlyPrillaCounter = 0;
        });
      }

      if (y == 0) {
        //604800
        setState(() {
          MyHomePageState.yearlyPrillaOnScreenDisplay = yearlyPrillaCounter;
          yearlyPrillaCounter = 0;
        });
      }
    });
  }

  @override
  void dispose() {
//record time of leaving
    MyHomePageState.abc = DateTime.now();
    clock.cancel();
    super.dispose();
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

_lastYear(yearlyPrillaOnScreenDisplay) {
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
          Text('$yearlyPrillaOnScreenDisplay',
              style: TextStyle(fontSize: 28, color: Color(0xff699985))),
          Text('prillor', style: TextStyle(fontSize: 12, color: Colors.white)),
        ])
      ]));
}
