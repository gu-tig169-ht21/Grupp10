import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'views/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_options.dart' as firebase_settings;
import 'provider/pouch_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: firebase_settings.getOptions(),
    );
  } catch (ex) {
    print('exploded: \n $ex');
  }

  //runApp(const MyApp());

  runApp(
    ChangeNotifierProvider(
      create: (context) => PouchProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nicotine Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(canvasColor: const Color(0xff202020))
          .copyWith(textTheme: GoogleFonts.ralewayTextTheme()),
      home: const MyHomePage(),
    );
  }
}

// dokumentation för vilken font tabs etc väljer
