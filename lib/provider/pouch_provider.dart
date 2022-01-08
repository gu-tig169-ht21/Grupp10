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

  //List<FlSpot> fllist = [];

  DateTime lastPouch = DateTime.now();

  Box? selectedBox;

  void getDayCount(DateTime date) {
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
}
