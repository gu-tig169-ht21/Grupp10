import 'package:flutter/material.dart';

class Timer extends StatelessWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('Du tog din senaste prilla för',
          style: TextStyle(color: Colors.white)),
      Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              '123',
              style: TextStyle(fontSize: 70.0, color: Color(0xff699985)),
            ),
            //customlayout isåfall lalala
          ),
          Positioned.directional(
            textDirection: TextDirection.rtl,
            start: 75,
            top: 30,
            child: Text(
              'minuter sedan',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      )
    ]);
  }
}
