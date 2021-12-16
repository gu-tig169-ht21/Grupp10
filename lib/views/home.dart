// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/views/historik.dart';
import 'package:my_first_app/views/prognos.dart';
import '../data/pouch.dart';
import '../data/pouch_dao.dart';
import 'timer.dart';
import 'konsumtion.dart';
import 'kostnad_totalt.dart';
import 'kostnad_idag.dart';

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
  final pouchDao = PouchDao();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _incrementCounter() {
    // lägger api-call här så länge - marcus
    final pouch = Pouch('test', DateTime.now());
    pouchDao.savePouch(pouch);
    setState(() {
      _counter++;
    });
  }

  void openMenu() {
    showModalBottomSheet(
        backgroundColor: Color.fromRGBO(70, 70, 70, 0.8),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                  leading: Icon(Icons.add, color: Colors.white),
                  title: Text('Lägg till dosa',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {}),
              Divider(
                height: 10,
                color: Colors.black,
                thickness: 0.2,
              ),
              ListTile(
                  leading: Icon(Icons.settings, color: Colors.white),
                  title: Text('Inställningar',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {}),
              Divider(
                height: 10,
                color: Colors.black,
                thickness: 0.2,
              ),
              ListTile(
                  leading: Icon(Icons.person, color: Colors.white),
                  title: Text(
                    'Integritet',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {}),
            ],
          );
        });
  }

  void _decreaseCounter() {
    setState(() {
      _counter--;
    });
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
          bottomNavigationBar: BottomNavigationBar(
            //showSelectedLabels: false,
            showUnselectedLabels: false,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Hem',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'Historik',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.timeline),
                label: 'Prognos',
              ),
            ],
            backgroundColor: const Color(0xff2d2d2d),
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.white,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
          body: _selectedIndex == 0
              ? TabBarView(
                  children: [
                    Scaffold(
                        body: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Timer(),
                              Container(height: 80),
                              Konsumtion(_counter),
                            ],
                          ),
                        ),
                        floatingActionButton: FloatingActionButton(
                          backgroundColor: const Color(0xff699985),
                          tooltip: 'Lägg till prilla',
                          child: const Icon(Icons.add),
                          onPressed: () {
                            _incrementCounter();
                            final snackBar = SnackBar(
                              backgroundColor: Color(0xff282828),
                              content: Text(
                                'Du har lagt till en prilla',
                                style: GoogleFonts.roboto(),
                              ),
                              action: SnackBarAction(
                                textColor: Color(0xff699985),
                                label: 'Ångra',
                                onPressed: () {
                                  _decreaseCounter();
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                        ),
                        floatingActionButtonLocation:
                            FloatingActionButtonLocation.centerFloat),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          KostnadTotalt(_costTotalCounter),
                          Container(height: 80),
                          KostnadIdag(_costTodayCounter),
                        ],
                      ),
                    )
                  ],
                )
              : _selectedIndex == 1
                  ? MyHistorikPage()
                  : MyPrognostPage(),
        ));
  }
}
