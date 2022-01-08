// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable
import 'dart:async';
import 'home.dart';
import 'package:flutter/material.dart';

//snackbar shows one extra time with rhytmic add prilla change screen
//could have just made a static method for registertimeatmoveintohome etc.

class TimerKonsumtionMinuter extends StatefulWidget {
  TimerKonsumtionMinuter(
    this.firstHomeWidgetBuild,
    this.registerTimeAtMoveAwayFromHome,
    this.setRegisterTimeAtMoveAwayFromHome,
    this.abcd,
  );

  bool firstHomeWidgetBuild;
  DateTime registerTimeAtMoveAwayFromHome;
  Function setRegisterTimeAtMoveAwayFromHome;
  Function abcd;

  @override
  State<TimerKonsumtionMinuter> createState() => TimerKonsumtionMinuterState();
}

class TimerKonsumtionMinuterState extends State<TimerKonsumtionMinuter> {
  static int senastePrillaTid = 0;
  static int senastePrillaTidRecorder = 0;
  static int temp = 0;
  DateTime registerTimeAtMoveIntoHome = DateTime.now();
  var oldNewDiff = 0;
  var clock;
  DateTime initMyHomePageTimeNow = DateTime.now();

  //senastePrillaTid ska va baserad på get hämtad siffra omväxlat till min

  @override
  void initState() {
    super.initState();
    initMyHomePageTimeNow = DateTime.now();

    //if widgetrebuild true
    oldNewDiff = initMyHomePageTimeNow //CONSIDER MAKING LOCAL VARIABLE
        .difference(MyHomePageState.initMyHomePageLatestTimeOfPrilla)
        .inSeconds;

    print(oldNewDiff);

    MyHomePageState.senastePrillaIndicatorTimer += oldNewDiff; //te.x 300

    // x = remainder sec of old new diff

    //widger rebuild false

    if (MyHomePageState.senastePrillaIndicatorTimer == 60) {
      //consider 60
      setState(() {
        MyHomePageState.senastePrillaIndicatorTimer = 0;
        senastePrillaTid += 1;

        if (senastePrillaTid > senastePrillaTidRecorder ||
            senastePrillaTid == 1) {
          senastePrillaTidRecorder = senastePrillaTid;
        }
      });
    } else if (MyHomePageState.senastePrillaIndicatorTimer > 60) {
      int floorvalue = MyHomePageState.senastePrillaIndicatorTimer
          .floor(); //math.floor? like 75 _> 70

      int remainder =
          MyHomePageState.senastePrillaIndicatorTimer - floorvalue; // = 5m

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

      MyHomePageState.senastePrillaIndicatorTimer = intFinalPasssedSeconds;
      temp = MyHomePageState.senastePrillaIndicatorTimer;
    }

    MyHomePageState.senastePrillaIndicatorTimer++;

    clock = Timer.periodic(Duration(seconds: 1), (timer) {
      print(
          ' MyHomePageState.senastePrillaIndicatorTimer is ${MyHomePageState.senastePrillaIndicatorTimer}');
      //göra till en widget or wha
      //if on this screne, only update the time stamp

      /* if (temp > 60 && x != 60) {
          temp = x; //check this
        } */
      if (MyHomePageState.senastePrillaIndicatorTimer == 60) {
        //consider 60
        setState(() {
          MyHomePageState.senastePrillaIndicatorTimer = 0;
          senastePrillaTid += 1;

          if (senastePrillaTid > senastePrillaTidRecorder ||
              senastePrillaTid == 1) {
            senastePrillaTidRecorder = senastePrillaTid;
          }
        });
      } else if (MyHomePageState.senastePrillaIndicatorTimer > 60) {
        int floorvalue = MyHomePageState.senastePrillaIndicatorTimer
            .floor(); //math.floor? like 75 _> 70

        int remainder =
            MyHomePageState.senastePrillaIndicatorTimer - floorvalue; // = 5m

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

        MyHomePageState.senastePrillaIndicatorTimer = intFinalPasssedSeconds;
        temp = MyHomePageState.senastePrillaIndicatorTimer;
      }

      MyHomePageState.senastePrillaIndicatorTimer++;

//dispose function instead
    });
  }

  @override
  void dispose() {
    //vs deactivate

    MyHomePageState.initMyHomePageLatestTimeOfPrilla = DateTime.now();

    clock.cancel();
    super.dispose();
  }

  static void runEqualXtoTemp() {
    MyHomePageState.senastePrillaIndicatorTimer = temp;

    //why no setstate
  }

  //timer widget in each widget

  //register temp

  static void registerTemp() {
    temp = MyHomePageState.senastePrillaIndicatorTimer;
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
