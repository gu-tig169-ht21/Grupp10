import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../services/pouch_provider.dart';
import '../widgets/chart_prognos.dart';

class Prognos extends StatefulWidget {
  const Prognos({Key? key}) : super(key: key);

  @override
  _PrognosState createState() => _PrognosState();
}

class _PrognosState extends State<Prognos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(padding: const EdgeInsets.all(10), children: [
          Container(height: 10),
          Column(
            children: [
              const Text('Din nuvarande årliga konsumtion är',
                  style: TextStyle(color: Colors.white, fontSize: 12)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<PouchProvider>(
                    builder: (context, state, child) => Text(
                      '${_calculateProjectedCost(state)}',
                      style: const TextStyle(
                        color: Color(0xff699985),
                        fontSize: 50.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text('kr',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ],
          ),
          _graf(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.circle, color: Color(0xff699985), size: 10),
              Text(' Konsumtion',
                  style: TextStyle(color: Colors.white, fontSize: 11)),
              SizedBox(width: 15),
              Icon(Icons.circle, color: Color(0xffffbe66), size: 10),
              Text(' Börsen',
                  style: TextStyle(color: Colors.white, fontSize: 11))
            ],
          ),
          const SizedBox(height: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Den gröna linjen visar hur mycket pengar du kommer spendera på snus om du konsumerar lika mycket som förgående år. Den orangea linjen visar vad du skulle kunna spara om du istället lägger in samma summa på börsen med en förväntad årlig avkastning på 7%',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                      fontSize: 12)),
            ],
          ),
        ]),
      ),
    );
  }

  Widget _graf() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: double.infinity,
          height: 400,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            color: const Color(0xff101010),
            child: const Padding(
              padding: EdgeInsets.fromLTRB(5, 25, 25, 5),
              child: LineChartPrognos(),
            ),
          ),
        ),
      ),
    );
  }

  int _calculateProjectedCost(PouchProvider state) {
    int currentYearCount = state.countYear;
    int price = state.selectedBox!.price;
    int boxPouches = state.selectedBox!.pouches;
    DateTime now = DateTime.now();
    DateTime firstDay = DateTime(now.year);
    DateTime firstDay2 = DateTime(now.year + 1);

    // inDays rundar ner, lägg till +1
    int dayOfYear = now.difference(firstDay).inDays + 1;

    double avgCount = currentYearCount / dayOfYear;

    int daysInYear = firstDay2.difference(firstDay).inDays;

    double projectedCount = avgCount * daysInYear;

    int projectedCost = (projectedCount * (price / boxPouches)).round();

    return projectedCost;
  }
}
