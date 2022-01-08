import 'package:flutter/material.dart';
import 'package:my_first_app/provider/pouch_provider.dart';
import 'dart:async';

import 'package:provider/provider.dart';

//om man är för snabb får man fel;

class TotalKonsumtionIdag extends StatefulWidget {
  @override
  State<TotalKonsumtionIdag> createState() => _TotalKonsumtionIdagState();
}

class _TotalKonsumtionIdagState extends State<TotalKonsumtionIdag> {
  @override
  void initState() {
    // TODO fixa bättre lösning
    Future.delayed(
        Duration.zero,
        () async => Provider.of<PouchProvider>(context, listen: false)
            .getDayCount(DateTime.now()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PouchProvider>(context, listen: false);
    return Consumer<PouchProvider>(
      builder: (context, state, child) => Column(
        children: [
          const Text('Du har totalt konsumerat',
              style: TextStyle(color: Colors.white)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<PouchProvider>(
                  builder: (context, state, child) => Text(
                        '${provider.countToday}',
                        style: const TextStyle(
                          color: Color(0xff699985),
                          fontSize: 70.0,
                        ),
                      )),
              const SizedBox(width: 5),
              const Text('prillor idag', style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
