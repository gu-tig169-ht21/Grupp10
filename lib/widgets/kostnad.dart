import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/pouch_provider.dart';

class Kostnad extends StatelessWidget {
  late final String _titleString;
  late final Function _priceW;

  Kostnad.idag({Key? key}) : super(key: key) {
    _titleString = 'Pengar du spenderat på snus idag';
    _priceW = _kostnadIdag;
  }

  Kostnad.totalt({Key? key}) : super(key: key) {
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
    double d = provider.countToday *
        (provider.selectedBox!.price / provider.selectedBox!.pouches);
    return d.round();
  }

  int _calculateTotalPrice(PouchProvider provider) {
    double d = provider.countTotal *
        (provider.selectedBox!.price / provider.selectedBox!.pouches);
    return d.round();
  }
}
