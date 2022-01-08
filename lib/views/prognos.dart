// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../charts/chart_prognos.dart';

class MyPrognosPage extends StatefulWidget {
  const MyPrognosPage({Key? key}) : super(key: key);

  @override
  _MyPrognosPageState createState() => _MyPrognosPageState();
}

class _MyPrognosPageState extends State<MyPrognosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView(padding: const EdgeInsets.all(10), children: [
      Container(height: 10),
      Column(
        children: [
          const Text('Din nuvarande årliga konsumtion är',
              style: TextStyle(color: Colors.white)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '7300',
                style: const TextStyle(
                  color: Color(0xff699985),
                  fontSize: 70.0,
                ),
              ),
              const SizedBox(width: 5),
              const Text('kr', style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
      _graf(),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.circle, color: Color(0xff699985), size: 10),
          Text(' Konsumtion', style: TextStyle(color: Colors.white)),
          SizedBox(width: 15),
          Icon(Icons.circle, color: Color(0xffffbe66), size: 10),
          Text(' Börsen', style: TextStyle(color: Colors.white))
        ],
      ),
      SizedBox(height: 5),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              'Den gröna linjen visar hur mycket pengar du kommer spendera på snus om du konsumerar lika mycket som förgående år. Den orangea linjen visar vad du skulle kunna spara om du istället lägger in samma summa på börsen med en förväntad årlig avkastning på 7%',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  color: Colors.grey, fontStyle: FontStyle.italic)),
        ],
      ),
    ])));
  }

  Widget _graf() {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: double.infinity,
              height: 400,
              child: Card(
                // elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: const Color(0xff111111),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 25, 25, 5),
                  child: LineChartPrognos(),
                ),
              ),
            )));
  }
}
