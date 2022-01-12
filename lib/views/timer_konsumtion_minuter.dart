// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_first_app/provider/pouch_provider.dart';
import 'package:provider/provider.dart';

class TimerKonsumtionMinuter extends StatefulWidget {
  @override
  State<TimerKonsumtionMinuter> createState() => TimerKonsumtionMinuterState();
}

class TimerKonsumtionMinuterState extends State<TimerKonsumtionMinuter> {
  Timer? _timer;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      var provider = Provider.of<PouchProvider>(context, listen: false);

      provider.getLastPouchTimeInMinutes();

      _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        provider.getLastPouchTimeInMinutes();
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('Du tog din senaste prilla för',
          style: TextStyle(color: Colors.white, fontSize: 12)),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<PouchProvider>(
              builder: (context, state, child) => Text(
                    '${state.minutesSinceLast}',
                    style: TextStyle(
                      color: Color(0xff699985),
                      fontSize: 50.0,
                    ),
                  )),
          SizedBox(width: 5),
          Text('minuter sedan',
              style: TextStyle(color: Colors.white, fontSize: 12)),
        ],
      )
    ]);
  }
}
