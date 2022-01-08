import 'dart:math';

import 'package:firebase_database/firebase_database.dart';

import 'pouch.dart';

class PouchDao {
  final DatabaseReference _pouchesRef =
      FirebaseDatabase.instance.ref().child('pouches');

  void savePouch(Pouch pouch) {
    _pouchesRef.push().set(pouch.toJson());
  }

  Future<int> getTodayCount(DateTime now) async {
    int counter = 0;
    DateTime now = DateTime.now();
    DateTime startToday = DateTime(now.year, now.month, now.day);
    DateTime endToday = DateTime(now.year, now.month, now.day, 23, 59, 59, 999);
    var query = _pouchesRef
        .orderByChild('date')
        .startAt(startToday.toString())
        .endAt(endToday.toString());

    await query.once().then((value) {
      //print(value.snapshot.children.length);
      counter = value.snapshot.children.length;
    });

    return counter;
  }

  Future<int> getMonthCount(int month) async {
    // TODO fixa hantering av år som inparameter
    int counter = 0;
    int currentYear = DateTime.now().year;
    DateTime startMonth = DateTime(currentYear, month, 1);
    DateTime endMonth = DateTime(currentYear, month + 1, 0, 23, 59, 59, 999);

    var query = _pouchesRef
        .orderByChild('date')
        .startAt(startMonth.toString())
        .endAt(endMonth.toString());

    await query.once().then((value) {
      //print(value.snapshot.children.length);
      counter = value.snapshot.children.length;
    });

    return counter;
  }

  Future<void> generateFakeData() async {
    // ett försök att skapa data för ett helt år
    // what could go wrong :-)
    Random rnd = new Random();
    int pouchCounter = 0;

    for (int i = 1; i <= 12; i++) {
      int lastDay = DateTime(2021, i + 1, 0).day;
      if (i == 12) {
        lastDay = DateTime.now().day - 1;
      }
      // vi tar och lugnar oss till en dag per månad för första försöket
      //lastDay = 1;
      for (int j = 1; j <= lastDay; j++) {
        for (int k = 8; k < 24; k++) {
          int chance = 1 + rnd.nextInt(100);
          if (chance >= 50) {
            pouchCounter++;
            // utkommenterat utifall någon kallar på funktionen av misstag
            //DateTime fakeDate = DateTime(2021, i, j, k);
            //Pouch fakePouch = Pouch("test", fakeDate);
            //_pouchesRef.push().set(fakePouch.toJson());
          }
        }
      }
    }
    print('skapade $pouchCounter nya pouches XD');
  }
}
