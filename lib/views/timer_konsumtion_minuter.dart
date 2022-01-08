// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_first_app/provider/pouch_provider.dart';
import 'package:provider/provider.dart';

//snackbar shows one extra time with rhytmic add prilla change screen
//could have just made a static method for registertimeatmoveintohome etc.

class TimerKonsumtionMinuter extends StatefulWidget {
  @override
  State<TimerKonsumtionMinuter> createState() => TimerKonsumtionMinuterState();
}

class TimerKonsumtionMinuterState extends State<TimerKonsumtionMinuter> {
  Timer? timer;

  //senastePrillaTid ska va baserad på get hämtad siffra omväxlat till min

  @override
  void initState() {
    // TODO fixa annan lösning här
    Future.delayed(
        Duration.zero,
        () async => Provider.of<PouchProvider>(context, listen: false)
            .getLastPouchTimeInMinutes());

    timer = Timer.periodic(
        const Duration(minutes: 1),
        (Timer timer) => Provider.of<PouchProvider>(context, listen: false)
            .getLastPouchTimeInMinutes());
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel;
    super.dispose();
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
          Consumer<PouchProvider>(
              builder: (context, state, child) => Text(
                    '${Provider.of<PouchProvider>(context, listen: false).minutesSinceLast}',
                    style: TextStyle(
                      color: Color(0xff699985),
                      fontSize: 70.0,
                    ),
                  )),
          SizedBox(width: 5),
          Text('minuter sedan', style: TextStyle(color: Colors.white)),
        ],
      )
    ]);
  }
}
