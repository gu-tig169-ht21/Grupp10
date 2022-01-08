// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:my_first_app/provider/pouch_provider.dart';
import 'package:provider/provider.dart';

class KostnadTotalt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PouchProvider>(context, listen: false);
    return Column(
      children: [
        const Text('Pengar du spenderat på snus sedan start',
            style: TextStyle(color: Colors.white)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${provider.countTotal * provider.selectedBox!.price}',
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
