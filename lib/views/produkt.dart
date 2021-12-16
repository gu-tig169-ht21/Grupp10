// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class NewProduct extends StatefulWidget {
  const NewProduct({Key? key}) : super(key: key);
  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  String dropdownValue = 'Ex. Dosa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2d2d2d),
        title: const Text('Nicotine Tracker',
            style: TextStyle(color: Colors.white)),
        leading: IconButton(
          color: const Color(0xff464646),
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: null,
          //   onPressed: () => openMenu(),
        ),
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
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text('Välj ditt standardsnus',
                style: TextStyle(color: Colors.white, fontSize: 16)),
            _dropDownSnus(),
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
              onPressed: () {},
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
}
