// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NyProdukt extends StatefulWidget {
  const NyProdukt({Key? key}) : super(key: key);
  @override
  State<NyProdukt> createState() => _NyProdukt();
}

class _NyProdukt extends State<NyProdukt> {
// temp här tills separat fil
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
                onTap: () {},
              ),
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

  String dropdownValue = 'Ex. Dosa';
  TextEditingController snusController = TextEditingController();

///////////
  late List<DropdownMenuItem<SnusAlternativ>> _snusItems;
  late SnusAlternativ _selectedSnus;

  @override
  void initState() {
    List<SnusAlternativ> dosor = SnusAlternativ.allaDosor;

    _snusItems = dosor.map<DropdownMenuItem<SnusAlternativ>>(
      (SnusAlternativ snusAlternativ) {
        return DropdownMenuItem<SnusAlternativ>(
          value: snusAlternativ,
          child: Text(snusAlternativ.snusNamn),
        );
      },
    ).toList();
    _selectedSnus = dosor[0];
    super.initState();
  }
///////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2d2d2d),
        title: const Text('Nicotine Tracker',
            style: TextStyle(color: Colors.white)),
        leading: IconButton(
            color: const Color(0xff464646),
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
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
        //  currentIndex: _selectedIndex,
        //  onTap: _onItemTapped,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            const Text('Välj ditt standardsnus',
                style: TextStyle(color: Colors.white, fontSize: 16)),
            _dropDownSnusTwo(),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Hittar du inte ditt snus i listan ovan?',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const Text(
              'Skriv in styckpriset manuellt!',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(200, 15, 200, 15),
              child: TextField(
                controller: snusController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.white, fontSize: 12),
                  labelText: 'Kr/prilla',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            const SizedBox(height: 150),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff699985),
                onPrimary: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('SPARA'),
            ),
//todo - kostnadsruta (välj snus har ett pris som också går till rutan)

//todo - spara
          ],
        ),
      ),
    );
  }

  Widget _dropDownSnus() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: Colors.white,
      ),
      elevation: 16,
      style: const TextStyle(color: Colors.white),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>[
        'Ex. Dosa',
        'General Classic Portion',
        'Lundgrens Norrland',
        'Ettan Original Portion',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _dropDownSnusTwo() {
    return DropdownButton<SnusAlternativ>(
      value: _selectedSnus,
      items: _snusItems,
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: Colors.white,
      ),
      elevation: 16,
      style: const TextStyle(color: Colors.white),
      onChanged: (newValue) {
        setState(() {
          _selectedSnus = newValue!;
          snusController.text = _selectedSnus.pris as String;
          // snusController.text = _selectedSnus.snusNamn;
          // ^  ? why no work som String
        });
      },
    );
  }
}

class SnusAlternativ {
  final int pris;
  final String snusNamn;

  SnusAlternativ(this.pris, this.snusNamn);

  static List<SnusAlternativ> get allaDosor => [
        SnusAlternativ(20, 'General Classic Portion'),
        SnusAlternativ(30, 'Lundgrens Norrland'),
        SnusAlternativ(10, 'Ettan Original Portion'),
      ];
}
