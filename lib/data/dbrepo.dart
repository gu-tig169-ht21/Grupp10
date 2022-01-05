import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'pouch.dart';
import 'box.dart';
import 'dart:math';
import 'package:week_of_year/week_of_year.dart';

class DataRepo {
  final db = FirebaseFirestore.instance;

  Future<String> addPouch(Pouch pouch) async {
    int counter = 0;
    String pouchId = "";
    DateTime now = DateTime.now();
    String today = "${now.year}-${now.month}-${now.day}";

    CollectionReference todayPouchesColl = FirebaseFirestore.instance
        .collection('users/test/dailyConsumption/$today/pouches');

    // TODO gör om pouchId till en DocumentReference istället för string
    await todayPouchesColl
        .add(pouch.toJson())
        .then((value) => pouchId = value.id);

    await incrementPouchCount();

/*
    var todayDoc = db.collection('users/test/dailyConsumption').doc(today);
    var userDoc = db.collection('users').doc('test');

    await todayDoc.get().then((doc) {
      if (doc.exists) {
        todayDoc.update({"count": FieldValue.increment(1)});
      } else {
        todayDoc.set({"count": 1});
      }
      userDoc.update({"countTotal": FieldValue.increment(1)});
    });
*/
    return pouchId;
  }

  Future<int> getDayCount(DateTime date) async {
    int counter = 0;
    String dateString = "${date.year}-${date.month}-${date.day}";

    var dateDoc = db.collection('users/test/dailyConsumption').doc(dateString);

    await dateDoc.get().then((doc) {
      if (doc.exists) {
        counter = doc.data()?["count"];
      } else {
        // ingen konsumption hittad för datum, counter är redan 0
      }
    });

    return counter;
  }

  Future<int> getWeekCount(int week) async {
    int counter = 0;
    int currentYear = DateTime.now().year;

    var weekDoc = db
        .collection('users/test/counters/$currentYear/weeks')
        .doc(week.toString());

    await weekDoc.get().then((doc) {
      if (doc.exists) {
        counter = doc.data()?["count"];
      } else {
        // counter noll
      }
    });

    return counter;
  }

  Future<int> getMonthCount(int month) async {
    // TODO fixa hantering av år som inparameter?
    int counter = 0;
    DateTime now = DateTime.now();
    int currentYear = now.year;

    var monthDoc = db
        .collection('users/test/counters/$currentYear/months')
        .doc(month.toString());

    await monthDoc.get().then((doc) {
      if (doc.exists) {
        counter = doc.data()?["count"];
      } else {
        // redan noll
      }
    });

    return counter;
  }

  Future<int> getYearCount(int year) async {
    int counter = 0;

    var yearDoc = db.collection('users/test/counters').doc(year.toString());

    await yearDoc.get().then((doc) {
      if (doc.exists) {
        counter = doc.data()?["count"];
      } else {
        // counter noll
      }
    });

    return counter;
  }

  Future<int> getTotalCount() async {
    int counter = 0;

    var userDoc = db.collection('users').doc('test');

    await userDoc.get().then((doc) => counter = doc.data()?["countTotal"]);

    return counter;
  }

  void removePouch(String docId) {
    DateTime now = DateTime.now();
    String today = "${now.year}-${now.month}-${now.day}";
    var userDoc = db.collection('users').doc('test');
    var dateDoc = db.collection('users/test/dailyConsumption').doc(today);
    var pouchDoc =
        db.collection('users/test/dailyConsumption/$today/pouches').doc(docId);

    // TODO gör om incrementPouchCount till att kunna hantera decrement och använd här?
    pouchDoc.delete().then((_) {
      userDoc.update({"countTotal": FieldValue.increment(-1)});
      dateDoc.update({"count": FieldValue.increment(-1)});
    });
  }

  Future<List<Box>> getBoxes() async {
    final boxColl = db.collection('users/test/boxes');

    List<Box> boxList = [];

    await boxColl.get().then((docs) => boxList = docs.docs
        .map((doc) => Box.fromJson(doc.data(), doc.reference))
        .toList());

    return boxList;
  }

  Future<void> updateBox(Box box) async {
    await box.ref.update(box.toJson());
  }

  Future<void> addBox(String name, int price) async {
    var boxColl = db.collection('users/test/boxes');

    await boxColl.add({"name": name, "price": price});
  }

  Future<void> incrementPouchCount() async {
    DateTime now = DateTime.now();
    String today = "${now.year}-${now.month}-${now.day}";
    var day = db.collection('users/test/dailyConsumption').doc(today);
    var year = db.collection('users/test/counters').doc(now.year.toString());
    var month = db
        .collection('users/test/counters/${now.year}/months')
        .doc(now.month.toString());
    var week = db
        .collection('users/test/counters/${now.year}/weeks')
        .doc(now.weekOfYear.toString());
    var total = db.collection('users').doc('test');

    await day.get().then((doc) {
      if (doc.exists) {
        day.update({"count": FieldValue.increment(1)});
      } else {
        day.set({"count": 1});
      }
    });

    await year.get().then((doc) {
      if (doc.exists) {
        year.update({"count": FieldValue.increment(1)});
      } else {
        year.set({"count": 1});
      }
    });

    await month.get().then((doc) {
      if (doc.exists) {
        month.update({"count": FieldValue.increment(1)});
      } else {
        month.set({"count": 1});
      }
    });

    await week.get().then((doc) {
      if (doc.exists) {
        week.update({"count": FieldValue.increment(1)});
      } else {
        week.set({"count": 1});
      }
    });

    await total.update({"countTotal": FieldValue.increment(1)});
  }

/*
  Future<DateTime> getLastPouchTime() {
    db.collection('users/test/dailyConsumption');

    return DateTime.now();
  }
  */
}
