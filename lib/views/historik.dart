import 'package:flutter/material.dart';

class MyHistorikPage extends StatefulWidget {
  const MyHistorikPage({Key? key}) : super(key: key);

  @override
  _MyHistorikPageState createState() => _MyHistorikPageState();
}

class _MyHistorikPageState extends State<MyHistorikPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('historik'),
    ));
  }
}
