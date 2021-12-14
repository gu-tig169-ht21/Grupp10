import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nicotine Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(canvasColor: const Color(0xff2d2d2d)).copyWith(
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: const MyHomePage(),
    );
  }
}

// dokumentation för vilken font tabs etc väljer