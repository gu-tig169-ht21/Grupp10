import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      Container(height: 20),
      Column(
        children: [
          Text(
              'Den senaste månadaden har du i genomsnitt snusat 10 prillor per dag vilket har kostat dig ca 20kr dagligen.',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  color: Colors.grey, fontStyle: FontStyle.italic)),
        ],
      ),
      Container(height: 20),
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
      Container(height: 20),
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
      // Container(height: 5),
      //  _grafBorsen(),
    ])));
  }

  Widget _graf() {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Align(
            alignment: Alignment.center,
            child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xff282828),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                          '(graf som visar kostnad du lägger på snus per år + pengar du hade sparat om du hade lagt in pengarna på börsen istället)',
                          style: TextStyle(fontSize: 18, color: Colors.grey))
                    ]))));
  }

  Widget _grafBorsen() {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Align(
            alignment: Alignment.center,
            child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xff282828),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                          '(graf som visar vad man hade haft på börsen per år)',
                          style: TextStyle(fontSize: 15, color: Colors.grey))
                    ]))));
  }
}
