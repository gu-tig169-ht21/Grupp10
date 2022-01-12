import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:week_of_year/week_of_year.dart';
import '/data/box.dart';
import '/data/dbRepo.dart';
import '/data/pouch.dart';

class PouchProvider extends ChangeNotifier {
  final _dbRepo = DataRepo();

  int countToday = 0;
  int countTotal = 0;
  int countWeek = 0;
  int countYear = 0;
  int countMonth = 0;

  int minutesSinceLast = 0;

  DateTime? lastPouch;
  DateTime? _oldLastPouch;

  Box? selectedBox;

  DocumentReference? _lastPouchDoc;

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
    _initData();
  }

  Future<void> _initData() async {
    DateTime now = DateTime.now();
    countToday = await _dbRepo.getDayCount(now);
    countTotal = await _dbRepo.getTotalCount();
    countWeek = await _dbRepo.getWeekCount(now.weekOfYear);
    countYear = await _dbRepo.getYearCount(now.year);
    countMonth = await _dbRepo.getMonthCount(now.month);
    lastPouch = await _dbRepo.getLatestPouchTime();
    minutesSinceLast = now.difference(lastPouch!).inMinutes;
    selectedBox = await _dbRepo.getSelectedBox();
    weekList = await _dbRepo.getWeekdaysCount(now);
    notifyListeners();
  }

  Future<List<Box>> getBoxes() async {
    List<Box> list;

    list = await _dbRepo.getBoxes();

    return list;
  }

  void updateBox(Box box) {
    _dbRepo.updateBox(box);
    selectedBox = box;
    notifyListeners();
  }

  void addBox(String name, int price, int pouches) {
    _dbRepo.addBox(name, price, pouches);
  }

  void selectBox(Box box) {
    _dbRepo.selectBox(box);
    selectedBox = box;
  }

  Future<Box> getSelectedBox() async {
    Box box;

    box = await _dbRepo.getSelectedBox();

    selectedBox = box;

    notifyListeners();

    return box;
  }

  void getLastPouchTimeInMinutes() {
    if (lastPouch != null) {
      minutesSinceLast = DateTime.now().difference(lastPouch!).inMinutes;

      notifyListeners();
    }
  }

  Future<void> addPouch(Pouch pouch) async {
    _oldLastPouch = lastPouch;
    lastPouch = pouch.date;
    _clientIncrement();
    _lastPouchDoc = await _dbRepo.addPouch(pouch);
  }

  Future<void> undoPouch() async {
    lastPouch = _oldLastPouch;
    _clientDecrement();
    await _dbRepo.removePouch(_lastPouchDoc!);
  }

  void _clientIncrement() {
    int day = DateTime.now().weekday;
    weekList[day - 1]++;
    countToday++;
    countWeek++;
    countMonth++;
    countYear++;
    countTotal++;
    notifyListeners();
  }

  void _clientDecrement() {
    int day = DateTime.now().weekday;
    weekList[day - 1]--;
    countToday--;
    countWeek--;
    countMonth--;
    countYear--;
    countTotal--;
    notifyListeners();
  }
}
