import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/pouch_provider.dart';

class TotalKonsumtionIdag extends StatefulWidget {
  const TotalKonsumtionIdag({Key? key}) : super(key: key);

  @override
  _TotalKonsumtionIdagState createState() => _TotalKonsumtionIdagState();
}

class _TotalKonsumtionIdagState extends State<TotalKonsumtionIdag> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Du har totalt konsumerat',
            style: TextStyle(color: Colors.white, fontSize: 12)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<PouchProvider>(
              builder: (context, state, child) => Text(
                '${state.countToday}',
                style: const TextStyle(
                  color: Color(0xff699985),
                  fontSize: 50.0,
                ),
              ),
            ),
            const SizedBox(width: 5),
            const Text('prillor idag',
                style: TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
      ],
    );
  }
}
