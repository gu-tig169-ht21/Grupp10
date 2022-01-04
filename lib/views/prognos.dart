import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/widgets/w_graf_prognos.dart';

class MyPrognosPage extends StatefulWidget {
  const MyPrognosPage({Key? key}) : super(key: key);

  @override
  _MyPrognosPageState createState() => _MyPrognosPageState();
}

class _MyPrognosPageState extends State<MyPrognosPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView(padding: const EdgeInsets.all(10), children: [
      Container(height: 10),
      Column(
        children: [
          Text(
              'Den senaste månadaden har du i genomsnitt snusat 10 prillor per dag vilket har kostat dig ca 20kr dagligen.',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  color: Colors.grey, fontStyle: FontStyle.italic)),
        ],
      ),
      Container(height: 10),
      Column(
        children: [
          Text('Testa att ändra din konsumtion',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 25.0,
            height: 25.0,
            child: FloatingActionButton(
              backgroundColor: const Color(0xff699985),
              tooltip: 'Lägg till prilla',
              child: const Icon(Icons.remove, size: 17.0),
              onPressed: () {
                _decreaseCounter();
              },
            ),
          ),
          const SizedBox(width: 15),
          Text(
            '$_counter',
            style: const TextStyle(
              color: Color(0xff699985),
              fontSize: 70.0,
            ),
          ),
          const SizedBox(width: 15),
          SizedBox(
            width: 25.0,
            height: 25.0,
            child: FloatingActionButton(
              backgroundColor: const Color(0xff699985),
              tooltip: 'Lägg till prilla',
              child: const Icon(Icons.add, size: 17.0),
              onPressed: () {
                _incrementCounter();
              },
            ),
          ),
        ],
      ),
      Column(
        children: [
          Text('prillor/dag', style: TextStyle(color: Colors.white)),
        ],
      ),
      _graf(),
      Column(
        children: [
          Text(
              'Grafen visar hur mycket pengar du kommer spendera på snus (orange) om du konsumerar lika mycket som förgående månad, samt vad du skulle kunna spara om du lägger in dina pengar på börsen med en förväntad årlig avkastning på 7% (grön).',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  color: Colors.grey, fontStyle: FontStyle.italic)),
        ],
      ),
    ])));
  }

  Widget _graf() {
    return Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: double.infinity,
              height: 350,
              child: Card(
                // elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: const Color(0xff111111),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 20, 20, 5),
                  child: GrafPrognosWidget(),
                ),
              ),
            )));
  }
}
