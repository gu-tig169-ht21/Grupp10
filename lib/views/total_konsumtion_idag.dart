import 'package:flutter/material.dart';

class TotalKonsumtionIdag extends StatelessWidget {
  TotalKonsumtionIdag(this._counter);

  final int _counter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Du har totalt konsumerat',
            style: TextStyle(color: Colors.white)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_counter',
              style: const TextStyle(
                color: Color(0xff699985),
                fontSize: 70.0,
              ),
            ),
            const SizedBox(width: 5),
            const Text('prillor idag', style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }
}
