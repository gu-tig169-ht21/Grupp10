import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/widgets/w_graf_prognos.dart';

class MyPrognosPage extends StatefulWidget {
  const MyPrognosPage({Key? key}) : super(key: key);

  @override
  _MyPrognosPageState createState() => _MyPrognosPageState();
}

class _MyPrognosPageState extends State<MyPrognosPage> {
  int _counter = 10;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
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
          Text('Din nuvarande årliga konsumtion',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '7300kr',
            style: const TextStyle(
              color: Color(0xff699985),
              fontSize: 70.0,
            ),
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
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: double.infinity,
              height: 400,
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
