import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'historik.dart';
import 'timer_konsumtion_minuter.dart';
import 'total_konsumtion_idag.dart';
import 'package:google_fonts/google_fonts.dart';
import './historik.dart';
import './timer_konsumtion_minuter.dart';
import 'home.dart';

class KonsumtionTab extends StatelessWidget {
  KonsumtionTab(
      this.firstHomeWidgetBuild,
      this._counter,
      this._incrementCounter,
      this._decreaseCounter,
      this.registerTimeAtMoveAwayFromHome,
      this.setRegisterTimeAtMoveAwayFromHome,
      this.abcd,
      {Key? key})
      : super(key: key);

  bool firstHomeWidgetBuild;
  int _counter;
  Function _incrementCounter;
  Function _decreaseCounter;
  DateTime registerTimeAtMoveAwayFromHome;
  Function setRegisterTimeAtMoveAwayFromHome;
  Function abcd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimerKonsumtionMinuter(
                firstHomeWidgetBuild,
                registerTimeAtMoveAwayFromHome,
                setRegisterTimeAtMoveAwayFromHome,
                abcd,
              ),
              Container(height: 80),
              TotalKonsumtionIdag(_counter),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff699985),
          tooltip: 'Lägg till prilla',
          child: const Icon(Icons.add),
          onPressed: () {
            _incrementCounter();
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
                  _decreaseCounter();

                  //decr week month etc counters too

                  MyHistorikPageState.weeklyPrillaCounter -= 1;
                  MyHistorikPageState.monthlyPrillaCounter -= 1;
                  MyHistorikPageState.yearlyPrillaCounter -= 1;

                  TimerKonsumtionMinuterState.runEqualXtoTemp();

                  TimerKonsumtionMinuterState.setPrillaTidToRecordTid();
                },
              ),
            );

            ScaffoldMessenger.of(context).hideCurrentSnackBar();

            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            //problem with 1 1 1 lies here

            TimerKonsumtionMinuterState.senastePrillaTid = 0;

            TimerKonsumtionMinuterState.registerTemp();

            MyHomePageState.senastePrillaIndicatorTimer = 0;

            MyHistorikPageState.weeklyPrillaCounter += 1;
            MyHistorikPageState.monthlyPrillaCounter += 1;
            MyHistorikPageState.yearlyPrillaCounter += 1;
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
