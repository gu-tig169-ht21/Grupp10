import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/pouch_provider.dart';

class HistoryBox extends StatelessWidget {
  late final String _case;

  HistoryBox.week({Key? key}) : super(key: key) {
    _case = 'week';
  }

  HistoryBox.month({Key? key}) : super(key: key) {
    _case = 'month';
  }

  HistoryBox.year({Key? key}) : super(key: key) {
    _case = 'year';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(60, 30, 60, 20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color(0xff1c1c1c),
      ),
      child: Consumer<PouchProvider>(
        builder: (context, state, child) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(children: [
              Text(
                '${_getCost(state)}',
                style: const TextStyle(
                  fontSize: 28,
                  color: Color(0xff699985),
                ),
              ),
              const Text(
                'kr',
                style: TextStyle(fontSize: 11, color: Colors.white),
              ),
            ]),
            Column(children: [
              Text(
                '${_getBoxes(state)}',
                style: const TextStyle(
                  fontSize: 28,
                  color: Color(0xff699985),
                ),
              ),
              const Text(
                'dosor',
                style: TextStyle(fontSize: 11, color: Colors.white),
              ),
            ]),
            Column(children: [
              Text(
                '${_getPouches(state)}',
                style: const TextStyle(
                  fontSize: 28,
                  color: Color(0xff699985),
                ),
              ),
              const Text(
                'prillor',
                style: TextStyle(fontSize: 11, color: Colors.white),
              ),
            ])
          ],
        ),
      ),
    );
  }

  int _getCost(PouchProvider provider) {
    double cost;

    switch (_case) {
      case 'week':
        cost = provider.countWeek *
            (provider.selectedBox!.price / provider.selectedBox!.pouches);
        return cost.round();
      case 'month':
        cost = provider.countMonth *
            (provider.selectedBox!.price / provider.selectedBox!.pouches);
        return cost.round();
      case 'year':
        cost = provider.countYear *
            (provider.selectedBox!.price / provider.selectedBox!.pouches);
        return cost.round();
    }
    return 0;
  }

  int _getBoxes(PouchProvider provider) {
    int boxes;

    switch (_case) {
      case 'week':
        boxes = provider.countWeek ~/ provider.selectedBox!.pouches;
        return boxes;
      case 'month':
        boxes = provider.countMonth ~/ provider.selectedBox!.pouches;
        return boxes;
      case 'year':
        boxes = provider.countYear ~/ provider.selectedBox!.pouches;
        return boxes;
    }
    return 0;
  }

  int _getPouches(PouchProvider provider) {
    int pouches;

    switch (_case) {
      case 'week':
        pouches = provider.countWeek;
        return pouches;
      case 'month':
        pouches = provider.countMonth;
        return pouches;
      case 'year':
        pouches = provider.countYear;
        return pouches;
    }
    return 0;
  }
}
