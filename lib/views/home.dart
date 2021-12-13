import 'package:flutter/material.dart';

import 'ekonomi.dart';
import 'historik.dart';
import 'prognos.dart';
import 'produkt.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int selectedIndex = 0;

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
                  title: Text('Lägg Till Dosa',
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        //  initialIndex:
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: const Color(0xff464646),
                title: const Text('Nicotine Tracker',
                    style: TextStyle(color: Colors.white)),
                leading: IconButton(
                  color: const Color(0xff464646),
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () => openMenu(),
                ),
                bottom: const TabBar(
                  tabs: [
                    Tab(text: 'Konsumtion'),
                    Tab(text: 'Ekonomi'),
                  ],
                  indicatorColor: Colors.transparent,
                  labelStyle: TextStyle(fontSize: 17, fontFamily: 'helvetica'),
                  unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      fontFamily: 'helvetica'),
                )),
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
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
              backgroundColor: const Color(0xff464646),
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.white,
              currentIndex: selectedIndex,
              onTap: (index) => setState(() {
                selectedIndex = index;
              }),
            ),
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
              backgroundColor: const Color(0xff95C8A8),
              onPressed: _incrementCounter,
              tooltip: 'Lägg till prilla',
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endFloat));
  }

  Widget _timer() {
    return Column(children: const [
      Text('Du tog din senaste prilla för',
          style: TextStyle(color: Colors.white)),
      Text(
        '0',
        style: TextStyle(
          color: Color(0xff95C8A8),
          fontSize: 70.0,
        ),
      ),
      Text('minuter sedan', style: TextStyle(color: Colors.white)),
    ]);
  }

  Widget _konsumtion() {
    return Column(children: [
      const Text('Du har totalt konsumerat',
          style: TextStyle(color: Colors.white)),
      Text(
        '$_counter',
        style: const TextStyle(
          color: Color(0xff95C8A8),
          fontSize: 70.0,
        ),
      ),
      const Text('prillor idag', style: TextStyle(color: Colors.white)),
    ]);
  }
}
