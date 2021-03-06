import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/widgets/timer_consumption_minutes.dart';
import 'package:provider/provider.dart';
import '../../models/pouch.dart';
import '../../services/pouch_provider.dart';
import '../../widgets/timer_consumption_minutes.dart';
import '../../widgets/total_consumption_today.dart';

class ConsumptionTab extends StatelessWidget {
  const ConsumptionTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PouchProvider>(context, listen: false);
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TimerConsumptionMinutes(),
              Container(height: 80),
              const TotalConsumptionToday(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff699985),
          tooltip: 'Lägg till prilla',
          child: const Icon(Icons.add),
          onPressed: () {
            _incrementCounter(provider);
            final snackBar = SnackBar(
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              backgroundColor: const Color(0xff1c1c1c),
              content: Text(
                'Du har lagt till en prilla',
                style: GoogleFonts.raleway(),
              ),
              action: SnackBarAction(
                textColor: const Color(0xff699985),
                label: 'Ångra',
                onPressed: () {
                  _decreaseCounter(provider);
                },
              ),
            );

            ScaffoldMessenger.of(context).hideCurrentSnackBar();

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }

  void _incrementCounter(PouchProvider provider) {
    DateTime now = DateTime.now();
    var newPouch = Pouch(now);
    provider.addPouch(newPouch);
  }

  void _decreaseCounter(PouchProvider provider) {
    provider.undoPouch().then((_) => provider.getLastPouchTimeInMinutes());
  }
}
