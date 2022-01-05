import 'package:cloud_firestore/cloud_firestore.dart';
import 'pouch.dart';
import 'daily_consumption.dart';
import 'dart:math';

class DataRepo {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('users/test/pouches');
  final db = FirebaseFirestore.instance;

  Future<int> addPouch(Pouch pouch) async {
    int counter = 0;
    DateTime now = DateTime.now();
    String today = "${now.year}-${now.month}-${now.day}";

    CollectionReference todayPouchesColl = FirebaseFirestore.instance
        .collection('users/test/dailyConsumption/$today/pouches');

    todayPouchesColl.add(pouch.toJson());

    var todayDoc = db.collection('users/test/dailyConsumption').doc(today);

    await todayDoc.get().then((doc) {
      if (doc.exists) {
        todayDoc.update({"count": FieldValue.increment(1)});
        var todayConsumption = DailyConsumption.fromJson(doc.data());
        counter = todayConsumption.count + 1;
        print(counter);
      } else {
        todayDoc.set({"count": 1});
        counter = 1;
        print(counter);
      }
    });

    return counter;
  }

  Future<int> getTodayCount(DateTime date) async {
    int counter = 0;
    String dateString = "${date.year}-${date.month}-${date.day}";

    var dateDoc = db.collection('users/test/dailyConsumption').doc(dateString);

    await dateDoc.get().then((doc) {
      if (doc.exists) {
        var todayConsumption = DailyConsumption.fromJson(doc.data());
        counter = todayConsumption.count;
      } else {
        // ingen konsumption hittad för datum, counter är redan 0
      }
    });

    return counter;
  }

  Future<int> getMonthCount(int month) async {
    // TODO fixa hantering av år som inparameter
    int counter = 0;
    int currentYear = DateTime.now().year;
    DateTime startMonth = DateTime(currentYear, month, 1);
    DateTime endMonth = DateTime(currentYear, month + 1, 0);

    return counter;
  }
}
