import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/box.dart';
import '../services/pouch_provider.dart';

class NyProdukt extends StatefulWidget {
  const NyProdukt({Key? key}) : super(key: key);
  @override
  _NyProdukt createState() => _NyProdukt();
}

class _NyProdukt extends State<NyProdukt> {
  TextEditingController snusController = TextEditingController();
  late List<DropdownMenuItem<Box>> _snusItems = [];
  Box? _selectedSnus;

  @override
  void initState() {
    List<Box> dosor = [];
    var provider = Provider.of<PouchProvider>(context, listen: false);

    provider.getBoxes().then((list) {
      setState(() {
        dosor = list;
        _snusItems = list.map((box) {
          return DropdownMenuItem<Box>(
            value: box,
            child: Text(box.name),
          );
        }).toList();

        provider.getSelectedBox().then((value) {
          for (var box in dosor) {
            if (box.ref == value.ref) {
              _selectedSnus = box;
            }
          }
          snusController.text = _selectedSnus!.price.toString();
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PouchProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff202020),
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
              const Text('Välj ditt standardsnus',
                  style: TextStyle(color: Colors.white, fontSize: 13)),
              const SizedBox(
                height: 10,
              ),
              _dropDownSnus(),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Hittar du inte ditt snus i listan ovan?',
                style: TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                    fontSize: 12),
              ),
              const Text(
                'Skriv in dospriset manuellt!',
                style: TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                    fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(150, 15, 150, 15),
                child: TextField(
                  cursorColor: const Color(0xff699985),
                  controller: snusController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
                      labelText: 'Kr/dosa',
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.1),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey))),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'(^\d*\.?\d{0,2})'))
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xff699985),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () {
                  _selectedSnus!.price = int.parse(snusController.text);

                  provider.updateBox(_selectedSnus!);
                  Navigator.pop(context);
                },
                child: const Text('SPARA', style: TextStyle(fontSize: 11)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dropDownSnus() {
    return Consumer<PouchProvider>(
      builder: (context, state, child) => DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<Box>(
            value: _selectedSnus,
            items: _snusItems,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(30),
            dropdownColor: const Color.fromRGBO(30, 30, 30, 0.9),
            elevation: 16,
            style: GoogleFonts.raleway(color: Colors.white, fontSize: 12),
            onChanged: (newValue) {
              setState(() {
                state.selectBox(newValue!);
                _selectedSnus = newValue;
                snusController.text = _selectedSnus!.price.toString();
              });
            },
          ),
        ),
      ),
    );
  }
}