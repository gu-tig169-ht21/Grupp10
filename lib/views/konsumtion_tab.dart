import 'package:flutter/material.dart';
import 'timer_konsumtion_minuter.dart';
import 'total_konsumtion_idag.dart';
import 'package:google_fonts/google_fonts.dart';

class KonsumtionTab extends StatelessWidget {
  const KonsumtionTab(this._counter, this._incrementCounter,
      this._decreaseCounter, this.activeSnackbar, this._setActiveSnackbar,
      {Key? key})
      : super(key: key);

  final int _counter;
  final Function _incrementCounter;
  final Function _decreaseCounter;
  final bool activeSnackbar;
  final Function _setActiveSnackbar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TimerKonsumtionMinuter(),
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
                },
              ),
            );

            ScaffoldMessenger.of(context).hideCurrentSnackBar();

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
