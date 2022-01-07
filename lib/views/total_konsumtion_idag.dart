import 'package:flutter/material.dart';
import 'dart:async';

//om man är för snabb får man fel;

class TotalKonsumtionIdag extends StatefulWidget {
  TotalKonsumtionIdag(this._counter);

  final int _counter;

  @override
  State<TotalKonsumtionIdag> createState() => _TotalKonsumtionIdagState();
}

class _TotalKonsumtionIdagState extends State<TotalKonsumtionIdag> {
  @override
  void initState() {
    super.initState();

    /*  Timer.periodic(Duration(seconds: 1), (timer) {
      if (DateTime.now().hour >= 24) {}

      if (!mounted) {
        timer.cancel();
      }
    }); */

/*if (kfokef >= 24){

} */

    var tkk = DateTime.now().hour;
  }

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
              '${widget._counter}',
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
