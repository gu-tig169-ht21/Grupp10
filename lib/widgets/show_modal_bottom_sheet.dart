import 'package:flutter/material.dart';
import '../screens/new_product.dart';

abstract class ShowModalBottomSheet extends StatelessWidget {
  const ShowModalBottomSheet({Key? key}) : super(key: key);

  static void runShowModalButtomSheet(context) {
    showModalBottomSheet(
      backgroundColor: const Color.fromRGBO(30, 30, 30, 0.8),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 45),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                leading: const Icon(Icons.add, color: Colors.white),
                title: const Text('Lägg till dosa',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NewProduct()),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
