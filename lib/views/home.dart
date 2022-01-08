// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/provider/pouch_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_nav.dart';
import 'ekonomi_tab.dart';
import 'historik.dart';
import 'konsumtion_tab.dart';
import 'ny_produkt.dart';
import 'prognos.dart';
import 'show_modal_bottom_sheet.dart';
import '../data/dbrepo.dart';
import '../data/pouch.dart';
import '../data/pouch_dao.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;
  int _costTotalCounter = 2555555;
  int _costTodayCounter = 0;
  final pouchDao = PouchDao();
  static var initMyHomePageLatestTimeOfPrilla =
      DateTime(2021, 3, 27, 23, 50, 30); // 2021 mar 21, 20:10:30
  static var abc = DateTime(2021, 1, 7, 13, 20,
      10); // mimics datetime at close of app //  variable retrvied from database, when entire app disposes, upload that date to database
  var firstHomeWidgetBuild = true;
  var firstHistorikWidgetBuild = true;
  DateTime registerTimeAtMoveAwayFromHome = DateTime(0);
  static DateTime historikPageLeaveTime = DateTime(0);

  static var weekTimer = 0; //resolve this variable, resolve this variable
  static var monthTimer = 0;
  static var yearTimer = 0;

  static var weeklyPrillaOnScreenDisplay = 0;
  static var monthlyPrillaOnScreenDisplay = 0;
  static var yearlyPrillaOnScreenDisplay = 0;

  static var senastePrillaIndicatorTimer = 0;

  static void recordHistorikPageLeaveTime(index) {
    historikPageLeaveTime = index;
  }

  void setRegisterTimeAtMoveAwayFromHome(index) {
    //static vs passdown access to state
    registerTimeAtMoveAwayFromHome = index;
  }

  void setFirstHistorikWidgetBuild() {
    firstHistorikWidgetBuild = false;
  }

  final DataRepo dbRepo = DataRepo();

  final appIsFirstLoaded = 'is_first_loaded';

  void _incrementCounter() {
    // lägger api-call här så länge - marcus
    final pouch = Pouch(DateTime.now());
    Provider.of<PouchProvider>(context, listen: false)
        .getLastPouchTimeInMinutes();
    /*
    dbRepo.addPouch(pouch).then((value) {
      setState(() {
        _counter++;
      });
    });
    */
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

  void abcd() {}

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showDialogIfFirstLoaded(context));
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
                    KonsumtionTab(),
                    EkonomiTab(_costTotalCounter, _costTodayCounter)
                  ],
                )
              : _selectedIndex == 1
                  ? MyHistorikPage(
                      firstHistorikWidgetBuild, setFirstHistorikWidgetBuild)
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
                      style: TextStyle(color: Color(0xff95C8A8)),
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
