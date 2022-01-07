// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_first_app/models/mod_ny_produkt.dart';
import 'package:my_first_app/provider/pouch_provider.dart';
import 'package:provider/provider.dart';
import '../data/box.dart';

class NyProdukt extends StatefulWidget {
  const NyProdukt({Key? key}) : super(key: key);
  @override
  State<NyProdukt> createState() => _NyProdukt();
}

class _NyProdukt extends State<NyProdukt> {
  //String dropdownValue = 'Ex. Dosa';
  TextEditingController snusController = TextEditingController();

  //late List<DropdownMenuItem<SnusAlternativ>> _snusItems;
  late List<DropdownMenuItem<Box>> _snusItems = [];
  Box? _selectedSnus;

  @override
  void initState() {
    List<Box> dosor = [];

    List<Box> boxlist = [];

    Provider.of<PouchProvider>(context, listen: false).getBoxes().then((value) {
      setState(() {
        dosor = value;
        _snusItems = value.map((box) {
          return DropdownMenuItem<Box>(
            value: box,
            child: Text(box.name),
          );
        }).toList();

        Provider.of<PouchProvider>(context, listen: false)
            .getSelectedBox()
            .then((value) {
          for (var box in dosor) {
            if (box.ref == value.ref) {
              _selectedSnus = box;
            }
          }
          snusController.text = _selectedSnus!.price.toString();
        });
      });
    });
    /*
    _snusItems = dosor.map<DropdownMenuItem<SnusAlternativ>>(
      (SnusAlternativ snusAlternativ) {
        return DropdownMenuItem<SnusAlternativ>(
          value: snusAlternativ,
          child: Text(snusAlternativ.snusNamn),
        );
      },
    ).toList();
    */
    //_selectedSnus = dosor[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PouchProvider pouchProvider =
        Provider.of<PouchProvider>(context, listen: false);

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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
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
                padding: const EdgeInsets.fromLTRB(150, 15, 150, 15),
                child: TextField(
                  controller: snusController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white, fontSize: 14),
                    labelText: 'Kr/dosa',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                    ),
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'(^\d*\.?\d{0,2})'))
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
                  var snusPris = int.parse(snusController.text);
                  _selectedSnus!.price = int.parse(snusController.text);

                  Provider.of<PouchProvider>(context, listen: false)
                      .updateBox(_selectedSnus!);
                  assert(snusPris is int);
                  print(snusPris);
                  Navigator.pop(context);
                },
                child: Text('SPARA'),
              ),
//todo - kostnadsruta (välj snus har ett pris som också går till rutan)

//todo - spara
            ],
          ),
        ),
      ),
    );
  }

  Widget _dropDownSnus() {
    PouchProvider pouchProvider =
        Provider.of<PouchProvider>(context, listen: false);
    return Consumer<PouchProvider>(
        builder: (context, state, child) => DropdownButton<Box>(
              value:
                  _selectedSnus, //pouchProvider.selectedBox, boxlist[4] =! selectedSnus
              items: _snusItems,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
              elevation: 16,
              style: const TextStyle(color: Colors.white),
              onChanged: (newValue) {
                setState(() {
                  pouchProvider.selectBox(newValue!);
                  _selectedSnus = newValue;
                  snusController.text = _selectedSnus!.price.toString();
                });
              },
            ));
    return DropdownButton<Box>(
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
          snusController.text = _selectedSnus!.price.toString();
        });
      },
    );
  }
}
