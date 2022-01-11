import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:week_of_year/week_of_year.dart';

import '../data/box.dart';
import '../data/dbrepo.dart';
import '../data/pouch.dart';

class PouchProvider extends ChangeNotifier {
  final dbRepo = DataRepo();

  int countToday = 0;
  int countTotal = 0;
  int countWeek = 0;
  int countYear = 0;
  int countMonth = 0;

  int minutesSinceLast = 0;

  DateTime? lastPouch;
  DateTime? oldLastPouch;

  Box? selectedBox;

  DocumentReference? lastPouchDoc;

  List<int> weekList = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];

  PouchProvider() {
    Future.delayed(Duration.zero, () async {
      DateTime now = DateTime.now();
      countToday = await dbRepo.getDayCount(now);
      countTotal = await dbRepo.getTotalCount();
      countWeek = await dbRepo.getWeekCount(now.weekOfYear);
      countYear = await dbRepo.getYearCount(now.year);
      countMonth = await dbRepo.getMonthCount(now.month);
      lastPouch = await dbRepo.getLatestPouchTime();
      minutesSinceLast = now.difference(lastPouch!).inMinutes;
      selectedBox = await dbRepo.getSelectedBox();
      notifyListeners();
    });
  }

  Future<List<Box>> getBoxes() async {
    var list;

    list = await dbRepo.getBoxes();

    return list;
  }

  void updateBox(Box box) {
    dbRepo.updateBox(box);
  }

  void addBox(String name, int price) {
    dbRepo.addBox(name, price);
  }

  void selectBox(Box box) {
    dbRepo.selectBox(box);
    selectedBox = box;
  }

  Future<Box> getSelectedBox() async {
    Box box;

    box = await dbRepo.getSelectedBox();

    selectedBox = box;

    notifyListeners();

    return box;
  }

  Future<void> getLastPouchTimeInMinutes() async {
    minutesSinceLast = DateTime.now().difference(lastPouch!).inMinutes;

    notifyListeners();
  }

  Future<void> addPouch(Pouch pouch) async {
    oldLastPouch = lastPouch;
    lastPouch = pouch.date;
    _clientIncrement();
    lastPouchDoc = await dbRepo.addPouch(pouch);
  }

  Future<void> undoPouch() async {
    lastPouch = oldLastPouch;
    _clientDecrement();
    await dbRepo.removePouch(lastPouchDoc!);
  }

  Future<void> getWeekList() async {
    DateTime now = DateTime.now();
    weekList = await dbRepo.getWeekdaysCount(now);
    notifyListeners();
  }

  void _clientIncrement() {
    countToday++;
    countWeek++;
    countMonth++;
    countYear++;
    countTotal++;
    notifyListeners();
  }

  void _clientDecrement() {
    countToday--;
    countWeek--;
    countMonth--;
    countYear--;
    countTotal--;
    notifyListeners();
  }
}
