import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../data/pouch.dart';
import '../provider/pouch_provider.dart';
import 'historik.dart';
import 'timer_konsumtion_minuter.dart';
import 'total_konsumtion_idag.dart';
import 'package:google_fonts/google_fonts.dart';
import './historik.dart';
import './timer_konsumtion_minuter.dart';
import 'home.dart';

class KonsumtionTab extends StatelessWidget {
  const KonsumtionTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimerKonsumtionMinuter(),
              Container(height: 80),
              TotalKonsumtionIdag(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff699985),
          tooltip: 'Lägg till prilla',
          child: const Icon(Icons.add),
          onPressed: () {
            _incrementCounter(context);
            final snackBar = SnackBar(
              backgroundColor: const Color(0xff282828),
              content: Text(
                'Du har lagt till en prilla',
                style: GoogleFonts.roboto(),
              ),
              action: SnackBarAction(
                textColor: const Color(0xff699985),
                label: 'Ångra',
                onPressed: () {
                  _decreaseCounter(context);
                },
              ),
            );

            ScaffoldMessenger.of(context).hideCurrentSnackBar();

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }

  void _incrementCounter(context) {
    var provider = Provider.of<PouchProvider>(context, listen: false);
    DateTime now = DateTime.now();
    var newPouch = Pouch(now);
    provider.addPouch(newPouch);
  }

  void _decreaseCounter(context) {
    var provider = Provider.of<PouchProvider>(context, listen: false);
    provider.undoPouch().then((_) => provider.getLastPouchTimeInMinutes());
  }
}
