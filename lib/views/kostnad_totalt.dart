import 'package:flutter/material.dart';

class KostnadTotalt extends StatelessWidget {
  KostnadTotalt(this._costTotalCounter);

  final int _costTotalCounter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Pengar du spenderat på snus sedan start',
            style: TextStyle(color: Colors.white)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_costTotalCounter',
              style: const TextStyle(
                color: Color(0xff699985),
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
