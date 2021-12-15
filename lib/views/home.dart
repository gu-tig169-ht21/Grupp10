// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/views/historik.dart';
import 'package:my_first_app/views/prognos.dart';

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _incrementCounter() {
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
                              _timer(),
                              Container(height: 80),
                              _konsumtion(),
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
                          _kostnadTotalt(),
                          Container(height: 80),
                          _kostnadIdag(),
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

  Widget _timer() {
    return Column(children: [
      const Text('Du tog din senaste prilla för',
          style: TextStyle(color: Colors.white)),
      Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              '123',
              style: TextStyle(fontSize: 70.0, color: Color(0xff699985)),
            ),
            //customlayout isåfall lalala
          ),
          Positioned.directional(
            textDirection: TextDirection.rtl,
            start: 75,
            top: 30,
            child: Text(
              'minuter sedan',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      )
    ]);
  }

  Widget _konsumtion() {
    return Column(
      children: [
        const Text('Du har totalt konsumerat',
            style: TextStyle(color: Colors.white)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_counter',
              style: const TextStyle(
                color: Color(0xff699985),
                fontSize: 70.0,
              ),
            ),
            const SizedBox(width: 5),
            const Text('prillor idag', style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }

  Widget _kostnadTotalt() {
    return Column(
      children: [
        const Text('Pengar du spenderat på snus sedan start',
            style: TextStyle(color: Colors.white)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_costTotalCounter',
              style: const TextStyle(
                color: Color(0xff95C8A8),
                fontSize: 70.0,
              ),
            ),
            const SizedBox(width: 5),
            const Text('kr', style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }

  Widget _kostnadIdag() {
    return Column(
      children: [
        const Text('Pengar du spenderat på snus idag',
            style: TextStyle(color: Colors.white)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_costTodayCounter',
              style: const TextStyle(
                color: Color(0xff95C8A8),
                fontSize: 70.0,
              ),
            ),
            const SizedBox(width: 5),
            const Text('kr', style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }
}
