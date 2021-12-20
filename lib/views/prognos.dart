import 'package:flutter/material.dart';

class MyPrognostPage extends StatefulWidget {
  const MyPrognostPage({Key? key}) : super(key: key);

  @override
  _MyPrognostPageState createState() => _MyPrognostPageState();
}

class _MyPrognostPageState extends State<MyPrognostPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('prognos'),
    ));
  }
}
