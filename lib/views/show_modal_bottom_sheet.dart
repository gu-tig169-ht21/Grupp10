import 'package:flutter/material.dart';
import 'ny_produkt.dart';

abstract class ShowModalBottomSheet extends StatelessWidget {
  const ShowModalBottomSheet({Key? key}) : super(key: key);

  static void runShowModalButtomSheet(context) {
    showModalBottomSheet(
        backgroundColor: const Color.fromRGBO(70, 70, 70, 0.8),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.add, color: Colors.white),
                title: const Text('Lägg till dosa',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NyProdukt()),
                  );
                },
              ),
              const Divider(
                height: 10,
                color: Colors.black,
                thickness: 0.2,
              ),
              ListTile(
                  leading: const Icon(Icons.settings, color: Colors.white),
                  title: const Text('Inställningar',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {}),
              const Divider(
                height: 10,
                color: Colors.black,
                thickness: 0.2,
              ),
              ListTile(
                  leading: const Icon(Icons.person, color: Colors.white),
                  title: const Text(
                    'Integritet',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {}),
            ],
          );
        });
  }
}
