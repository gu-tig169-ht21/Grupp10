import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:week_of_year/week_of_year.dart';
import '/charts/chart_historik.dart';
import '/views/history_box.dart';

class MyHistorikPage extends StatefulWidget {
  const MyHistorikPage({Key? key}) : super(key: key);

  @override
  MyHistorikPageState createState() => MyHistorikPageState();
}

class MyHistorikPageState extends State<MyHistorikPage> {
  @override
  Widget build(BuildContext context) {
    int veckonr = DateTime.now().weekOfYear;

    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            _graf(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.circle, color: Color(0xff699985), size: 10),
                Text(' Antal prillor per dag för vecka $veckonr',
                    style: const TextStyle(color: Colors.white, fontSize: 12))
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text('DENNA VECKAN',
                    style:
                        GoogleFonts.raleway(fontSize: 12, color: Colors.grey)),
              ],
            ),
            HistoryBox.week(),
            Container(height: 10),
            Row(
              children: [
                Text('DENNA MÅNADEN',
                    style:
                        GoogleFonts.raleway(fontSize: 12, color: Colors.grey)),
              ],
            ),
            HistoryBox.month(),
            Container(height: 10),
            Row(
              children: [
                Text('HELA ÅRET',
                    style:
                        GoogleFonts.raleway(fontSize: 12, color: Colors.grey)),
              ],
            ),
            HistoryBox.year(),
          ],
        ),
      ),
    );
  }
}

Widget _graf() {
  return Container(
    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
    child: Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: double.infinity,
        height: 250,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          color: const Color(0xff101010),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 25, 25, 5),
            child: BarChartHistorik(),
          ),
        ),
      ),
    ),
  );
}
