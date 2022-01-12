// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:my_first_app/provider/pouch_provider.dart';
import 'package:provider/provider.dart';

class Kostnad extends StatelessWidget {
  late final String _titleString;
  late final Function _priceW;

  Kostnad.idag() {
    _titleString = 'Pengar du spenderat på snus idag';
    _priceW = _kostnadIdag;
  }

  Kostnad.totalt() {
    _titleString = 'Pengar du spenderat på snus sedan start';
    _priceW = _kostnadTotalt;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_titleString,
            style: const TextStyle(color: Colors.white, fontSize: 12)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _priceW(),
            const SizedBox(width: 5),
            const Text('kr',
                style: TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
      ],
    );
  }

  Widget _kostnadIdag() {
    return Consumer<PouchProvider>(
      builder: (context, state, child) => Text(
        '${_calculateTodayPrice(state)}',
        style: const TextStyle(
          color: Color(0xff699985),
          fontSize: 50.0,
        ),
      ),
    );
  }

  Widget _kostnadTotalt() {
    return Consumer<PouchProvider>(
      builder: (context, state, child) => Text(
        '${_calculateTotalPrice(state)}',
        style: const TextStyle(
          color: Color(0xff699985),
          fontSize: 50.0,
        ),
      ),
    );
  }

  int _calculateTodayPrice(PouchProvider provider) {
    return provider.countToday * provider.selectedBox!.price;
  }

  int _calculateTotalPrice(PouchProvider provider) {
    return provider.countTotal * provider.selectedBox!.price;
  }
}
