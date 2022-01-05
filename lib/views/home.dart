// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields
//måste file namnet matcha klass namnet här
//måste en klass ha en build metod om en widget används i en klass som redan har en build metod
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/views/historik.dart';
import 'package:my_first_app/views/prognos.dart';
import '../data/pouch.dart';
import '../data/dbrepo.dart';
import 'konsumtion_tab.dart';
import 'ekonomi_tab.dart';
import 'bottom_nav.dart';
import 'show_modal_bottom_sheet.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;
  int _costTotalCounter = 2555555;
  int _costTodayCounter = 0;
  final DataRepo dbRepo = DataRepo();

  void _incrementCounter() {
    // lägger api-call här så länge - marcus
    final pouch = Pouch(DateTime.now());
    dbRepo.addPouch(pouch).then((value) {
      setState(() {
        _counter = value;
      });
    });
  }

  void _decreaseCounter() {
    setState(() {
      _counter--;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void openMenu() {
    ShowModalBottomSheet.runShowModalButtomSheet(context);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: const Color(0xff2d2d2d),
              title: const Text('Nicotine Tracker',
                  style: TextStyle(color: Colors.white)),
              leading: IconButton(
                color: const Color(0xff464646),
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => openMenu(),
              ),
              bottom: _selectedIndex == 0
                  ? TabBar(
                      tabs: <Widget>[
                          Tab(
                              child: (Text('Konsumtion',
                                  style: GoogleFonts.roboto()))),
                          Tab(
                              child:
                                  Text('Ekonomi', style: GoogleFonts.roboto())),
                        ],
                      indicatorColor: Colors.transparent,
                      labelStyle: TextStyle(fontSize: 16),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 14,
                      ))
                  : null),
          bottomNavigationBar: BottomNav(_selectedIndex, _onItemTapped),
          body: _selectedIndex == 0
              ? TabBarView(
                  children: [
                    KonsumtionTab(
                      _counter,
                      _incrementCounter,
                      _decreaseCounter,
                    ),
                    EkonomiTab(_costTotalCounter, _costTodayCounter)
                  ],
                )
              : _selectedIndex == 1
                  ? MyHistorikPage()
                  : MyPrognosPage(),
        ));
  }
}
