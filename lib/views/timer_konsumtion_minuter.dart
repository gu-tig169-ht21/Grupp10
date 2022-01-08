// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable
import 'dart:async';

import 'package:flutter/material.dart';

//snackbar shows one extra time with rhytmic add prilla change screen
//could have just made a static method for registertimeatmoveintohome etc.

class TimerKonsumtionMinuter extends StatefulWidget {
  TimerKonsumtionMinuter(
      this.initMyHomePageLatestTimeOfPrilla,
      this.initMyHomePageTimeNow,
      this.firstHomeWidgetBuild,
      this.setFirstHomeWidgetBuild,
      this.registerTimeAtMoveAwayFromHome,
      this.setRegisterTimeAtMoveAwayFromHome);
  DateTime initMyHomePageLatestTimeOfPrilla;
  DateTime initMyHomePageTimeNow;
  bool firstHomeWidgetBuild;
  Function setFirstHomeWidgetBuild;
  DateTime registerTimeAtMoveAwayFromHome;
  Function setRegisterTimeAtMoveAwayFromHome;

  @override
  State<TimerKonsumtionMinuter> createState() => TimerKonsumtionMinuterState();
}

class TimerKonsumtionMinuterState extends State<TimerKonsumtionMinuter> {
  static int senastePrillaTid = 0;
  static int senastePrillaTidRecorder = 0;
  static int x = 0;
  static int temp = 0;
  DateTime registerTimeAtMoveIntoHome = DateTime.now();
  var oldNewDiff = 0;

  //senastePrillaTid ska va baserad på get hämtad siffra omväxlat till min

  @override
  void initState() {
    super.initState();

    if (widget.firstHomeWidgetBuild) {
      //if widgetrebuild true
      oldNewDiff = widget.initMyHomePageTimeNow //CONSIDER MAKING LOCAL VARIABLE
          .difference(widget.initMyHomePageLatestTimeOfPrilla)
          .inSeconds;

      x = oldNewDiff; //te.x 300

      // x = remainder sec of old new diff

      widget.setFirstHomeWidgetBuild();

      //widger rebuild false
    } else {
      oldNewDiff = registerTimeAtMoveIntoHome
          .difference(widget.registerTimeAtMoveAwayFromHome)
          .inSeconds;

      x = oldNewDiff; //tex 2m => 120s
    }

    Timer.periodic(Duration(seconds: 1), (timer) {
      //if on this screne, only update the time stamp

      /* if (temp > 60 && x != 60) {
          temp = x; //check this
        } */

      if (x == 59) {
        //consider 60
        setState(() {
          x = 0;
          senastePrillaTid += 1;

          if (senastePrillaTid > senastePrillaTidRecorder ||
              senastePrillaTid == 1) {
            senastePrillaTidRecorder = senastePrillaTid;
          }
        });
      } else if (x > 59) {
        int floorvalue = x.floor(); //math.floor? like 75 _> 70

        int remainder = x - floorvalue; // = 5m

        double mesh = senastePrillaTid.toDouble(); //2 to 2.0

        mesh = (mesh +
            (floorvalue /
                60)); //2.0 + 70 / 60 to floor. remander add to remainder 3.16666

        double a = mesh - mesh.floor();

        double b = 60 * a; //dvs 10m

        double doubleFinalPassedSeconds = remainder + b; //dvs 15

        int intFinalPasssedSeconds = doubleFinalPassedSeconds.toInt();

        //mesh.floor for senasteprilla //seconds remaining = mesh x 60 // secondsremaining + remainder

        setState(() {
          senastePrillaTid = mesh.floor().toInt();

          // i think
          //1 min, 20s //+1 to senasteprilla och 20s på x
        });

        x = intFinalPasssedSeconds;
        temp = x;
      }

      x++;

      if (!mounted) {
        widget.setRegisterTimeAtMoveAwayFromHome(DateTime.now());
        timer.cancel();
      }
    });
  }

  static void runEqualXtoTemp() {
    x = temp;

    //why no setstate
  }

  //timer widget in each widget

  //register temp

  static void registerTemp() {
    temp = x;
  }

  static void setPrillaTidToRecordTid() {
    senastePrillaTid = senastePrillaTidRecorder;

    // https://stackoverflow.com/questions/46057353/controlling-state-from-outside-of-a-statefulwidget?rq=1
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('Du tog din senaste prilla för',
          style: TextStyle(color: Colors.white)),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$senastePrillaTid',
            style: TextStyle(
              color: Color(0xff699985),
              fontSize: 70.0,
            ),
          ),
          SizedBox(width: 5),
          Text('minuter sedan', style: TextStyle(color: Colors.white)),
        ],
      )
    ]);
  }
}
