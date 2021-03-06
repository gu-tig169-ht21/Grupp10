import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week_of_year/week_of_year.dart';
import '../models/box.dart';
import '../models/pouch.dart';

class DataRepo {
  final db = FirebaseFirestore.instance;

  Future<DocumentReference> addPouch(Pouch pouch) async {
    // ignore: prefer_typing_uninitialized_variables
    var pouchDoc;
    DateTime now = DateTime.now();
    String today = "${now.year}-${now.month}-${now.day}";

    CollectionReference todayPouchesColl = FirebaseFirestore.instance
        .collection('users/test/dailyConsumption/$today/pouches');

    await todayPouchesColl.add(pouch.toJson()).then((doc) => pouchDoc = doc);

    await incrementPouchCount(1);

    return pouchDoc;
  }

  Future<int> getDayCount(DateTime date) async {
    int counter = 0;
    String dateString = "${date.year}-${date.month}-${date.day}";

    var dateDoc = db.collection('users/test/dailyConsumption').doc(dateString);

    await dateDoc.get().then((doc) {
      if (doc.exists) {
        counter = doc.data()?["count"];
      } else {
        // ingen konsumption hittad för datum, counter = 0
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
        // ingen konsumption hittad för datum, counter = 0
      }
    });

    return counter;
  }

  Future<int> getMonthCount(int month) async {
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
        // ingen konsumption hittad för datum, counter är 0
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
        // ingen konsumption hittad för datum, counter är 0
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

  Future<void> removePouch(DocumentReference docId) async {
    await docId.delete().then((_) {
      incrementPouchCount(-1);
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

  Future<void> addBox(String name, int price, int pouches) async {
    var boxColl = db.collection('users/test/boxes');

    await boxColl.add({
      "name": name,
      "price": price,
      "pouches": pouches,
    });
  }

  Future<void> selectBox(Box box) async {
    var userDoc = db.collection('users').doc('test');

    await userDoc.update({"selectedBox": box.ref});
  }

  Future<Box> getSelectedBox() async {
    var userDoc = db.collection('users').doc('test');
    // ignore: prefer_typing_uninitialized_variables
    var boxDoc;
    // ignore: prefer_typing_uninitialized_variables
    var box;

    await userDoc.get().then((doc) {
      if (doc.exists) {
        boxDoc = doc.data()?["selectedBox"];
      }
    });

    await boxDoc.get().then((doc) {
      box = Box.fromJson(doc.data() as Map<String, dynamic>, doc.reference);
    });

    return box;
  }

  Future<void> incrementPouchCount(int i) async {
    DateTime now = DateTime.now();
    DateTime todayFormatted = DateTime(now.year, now.month, now.day);
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
        if (doc.data()?["count"] + i == 0) {
          day.delete();
        } else {
          day.update({"count": FieldValue.increment(i)});
        }
      } else {
        day.set({"count": 1, "date": todayFormatted.toString()});
      }
    });

    year.get().then((doc) {
      if (doc.exists) {
        year.update({"count": FieldValue.increment(i)});
      } else {
        year.set({"count": 1, "year": now.year});
      }
    });

    month.get().then((doc) {
      if (doc.exists) {
        month.update({"count": FieldValue.increment(i)});
      } else {
        month.set({"count": 1, "month": now.month});
      }
    });

    week.get().then((doc) {
      if (doc.exists) {
        week.update({"count": FieldValue.increment(i)});
      } else {
        week.set({"count": 1, "week": now.weekOfYear});
      }
    });

    total.update({"countTotal": FieldValue.increment(i)});
  }

  Future<DateTime> getLatestPouchTime() async {
    var daysColl = db
        .collection('users/test/dailyConsumption')
        .orderBy("date", descending: true)
        .limit(1);

    var days = await daysColl.get();

    var lastDay = days.docs.first.id;

    var pouchColl =
        db.collection('users/test/dailyConsumption/$lastDay/pouches');

    var pouchList =
        await pouchColl.orderBy("date", descending: true).limit(1).get();

    var dateString = pouchList.docs.first.data()["date"];

    DateTime lastPouch = DateTime.parse(dateString);

    return lastPouch;
  }

  Future<List<int>> getWeekdaysCount(DateTime date) async {
    DateTime firstwday =
        DateTime(date.year, date.month, date.day - date.weekday + 1);
    DateTime lastwday = DateTime(date.year, date.month, date.day);
    List<int> list = [0, 0, 0, 0, 0, 0, 0];
    var wq = db
        .collection('users/test/dailyConsumption')
        .orderBy("date", descending: false)
        .where("date", isGreaterThanOrEqualTo: firstwday.toString())
        .where("date", isLessThanOrEqualTo: lastwday.toString());

    await wq.get().then((docs) {
      if (docs.docs.isNotEmpty) {
        for (var doc in docs.docs) {
          DateTime daydate = DateTime.parse(doc.data()["date"]);
          int i = daydate.weekday - 1;
          list[i] = doc.data()["count"];
        }
      }
    });

    return list;
  }
}
