import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../data/dbrepo.dart';
import '../data/box.dart';
import '../data/pouch.dart';
import 'package:week_of_year/week_of_year.dart';

class PouchProvider extends ChangeNotifier {
  final dbRepo = DataRepo();

  int countToday = 0;
  int countTotal = 0;
  int countWeek = 0;
  int countYear = 0;
  int countMonth = 0;

  int minutesSinceLast = 0;

  //List<FlSpot> fllist = [];

  DateTime? lastPouch;

  Box? selectedBox;

  DocumentReference? lastPouchDoc;

  Future<void> getDayCount(DateTime date) async {
    dbRepo.getDayCount(date).then((count) {
      countToday = count;
      notifyListeners();
    });
  }

  void getWeekCount() {
    dbRepo.getWeekCount(DateTime.now().weekOfYear).then((count) {
      countWeek = count;
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
    lastPouch ??= await dbRepo.getLatestPouchTime();

    minutesSinceLast = DateTime.now().difference(lastPouch!).inMinutes;

    notifyListeners();
    print(minutesSinceLast);
    print(lastPouch);
  }

  Future<void> addPouch(Pouch pouch) async {
    lastPouch = pouch.date;
    _clientIncrement();
    lastPouchDoc = await dbRepo.addPouch(pouch);
  }

  Future<void> undoPouch() async {
    _clientDecrement();
    await dbRepo.removePouch(lastPouchDoc!);
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
