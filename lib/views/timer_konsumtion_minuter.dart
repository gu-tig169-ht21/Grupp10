import 'package:flutter/material.dart';

class TimerKonsumtionMinuter extends StatelessWidget {
  const TimerKonsumtionMinuter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('Du tog din senaste prilla för',
          style: TextStyle(color: Colors.white)),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            '12',
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
