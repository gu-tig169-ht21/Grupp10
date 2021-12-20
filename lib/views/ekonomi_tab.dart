import 'package:flutter/material.dart';
import 'kostnad_totalt.dart';
import 'kostnad_idag.dart';

class EkonomiTab extends StatelessWidget {
  const EkonomiTab(this._costTotalCounter, this._costTodayCounter, {Key? key})
      : super(key: key);

  final int _costTotalCounter;
  final int _costTodayCounter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          KostnadTotalt(_costTotalCounter),
          Container(height: 80),
          KostnadIdag(_costTodayCounter),
        ],
      ),
    );
  }
}
