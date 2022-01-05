import 'dart:async';

import 'package:flutter/material.dart';

class TimerKonsumtionMinuter extends StatefulWidget {
  TimerKonsumtionMinuter({Key? key}) : super(key: key);

  @override
  State<TimerKonsumtionMinuter> createState() => TimerKonsumtionMinuterState();
}

class TimerKonsumtionMinuterState extends State<TimerKonsumtionMinuter> {
  static int senastePrillaTid = 0;
  static int senastePrillaTidRecorder = 0;
  static bool renderSenastePrillaTidRecorder = false;
  static int x = 0;
  static int temp = 0;

  TimerKonsumtionMinuterState() {
    runStuff();
  }

  static void runEqualXtoTemp() {
    x = temp;
    print('hello');
    print(x);
    print(temp);
  }

  void runStuff() async {
    Timer.periodic(Duration(seconds: 1), (e) {
      x++;
      temp++;

      if (x == 8) {
        setState(() {
          senastePrillaTid += 1;
          renderSenastePrillaTidRecorder = false;
        });

        if (senastePrillaTid > senastePrillaTidRecorder) {
          senastePrillaTidRecorder = senastePrillaTid;
        }

        x = 0;
        temp = 0;
      }
    });
  }

  static void revertTimeStamp() {
    renderSenastePrillaTidRecorder = true;
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
            renderSenastePrillaTidRecorder
                ? '$senastePrillaTidRecorder'
                : '$senastePrillaTid',
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
