import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'historik.dart';
import 'timer_konsumtion_minuter.dart';
import 'total_konsumtion_idag.dart';

class KonsumtionTab extends StatelessWidget {
  const KonsumtionTab(
      this.initMyHomePageLatestTimeOfPrilla,
      this.initMyHomePageTimeNow,
      this.firstHomeWidgetBuild,
      this.setFirstHomeWidgetBuild,
      this._counter,
      this._incrementCounter,
      this._decreaseCounter,
      this.registerTimeAtMoveAwayFromHome,
      this.setRegisterTimeAtMoveAwayFromHome,
      {Key? key})
      : super(key: key);

  final DateTime initMyHomePageLatestTimeOfPrilla;
  final DateTime initMyHomePageTimeNow;
  final bool firstHomeWidgetBuild;
  final Function setFirstHomeWidgetBuild;
  final int _counter;
  final Function _incrementCounter;
  final Function _decreaseCounter;
  final DateTime registerTimeAtMoveAwayFromHome;
  final Function setRegisterTimeAtMoveAwayFromHome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimerKonsumtionMinuter(
                  initMyHomePageLatestTimeOfPrilla,
                  initMyHomePageTimeNow,
                  firstHomeWidgetBuild,
                  setFirstHomeWidgetBuild,
                  registerTimeAtMoveAwayFromHome,
                  setRegisterTimeAtMoveAwayFromHome),
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

                  MyHistorikPageState.senasteVeckanPrillor -= 1;

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

            MyHistorikPageState.senasteVeckanPrillor += 1;

            TimerKonsumtionMinuterState.senastePrillaTid = 0;

            TimerKonsumtionMinuterState.registerTemp();

            TimerKonsumtionMinuterState.x = 0;

            MyHistorikPageState.weeklyPrillaCounter += 1;
            MyHistorikPageState.monthlyPrillaCounter += 1;
            MyHistorikPageState.yearlyPrillaCounter += 1;
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
