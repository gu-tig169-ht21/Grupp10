import 'package:flutter/material.dart';

class KostnadIdag extends StatelessWidget {
  KostnadIdag(this._costTodayCounter);

  final int _costTodayCounter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Pengar du spenderat på snus idag',
            style: TextStyle(color: Colors.white)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_costTodayCounter',
              style: const TextStyle(
                color: Color(0xff95C8A8),
                fontSize: 70.0,
              ),
            ),
            const SizedBox(width: 5),
            const Text('kr', style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }
}
