// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_nav.dart';
import 'ekonomi_tab.dart';
import 'historik.dart';
import 'konsumtion_tab.dart';
import 'ny_produkt.dart';
import 'prognos.dart';
import 'show_modal_bottom_sheet.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final appIsFirstLoaded = 'is_first_loaded';

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
    Future.delayed(Duration.zero, () => showDialogIfFirstLoaded(context));
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: const Color(0xff202020), //Color(0xff2d2d2d),
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
                                  style: GoogleFonts.raleway(fontSize: 13)))),
                          Tab(
                              child: Text('Ekonomi',
                                  style: GoogleFonts.raleway(fontSize: 13))),
                        ],
                      indicatorColor: Colors.transparent,
                      labelStyle: TextStyle(fontSize: 12),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 12,
                      ))
                  : null),
          bottomNavigationBar: BottomNav(_selectedIndex, _onItemTapped),
          body: _selectedIndex == 0
              ? TabBarView(
                  children: [KonsumtionTab(), EkonomiTab()],
                )
              : _selectedIndex == 1
                  ? MyHistorikPage()
                  : MyPrognosPage(),
        ));
  }

  showDialogIfFirstLoaded(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstLoaded = prefs.getBool(appIsFirstLoaded);
    if (isFirstLoaded == null) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              backgroundColor: Colors.black45,
              title: Text(
                'Greetings Traveler',
                style: TextStyle(color: Colors.white),
              ),
              content: Text(
                'Börja med att lägga till ditt val av snus \n(detta kan när som helst ändras i menyn)',
                style: TextStyle(color: Colors.white),
              ),
              actions: <Widget>[
                TextButton(
                    child: Text(
                      'Välj Snus',
                      style: TextStyle(color: Color(0xff699985)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NyProdukt()));
                      prefs.setBool(appIsFirstLoaded, false);
                    })
              ],
            );
          });
    }
  }
}
