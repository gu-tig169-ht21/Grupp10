import 'package:flutter/material.dart';
import '../../widgets/cost.dart';

class EconomyTab extends StatelessWidget {
  const EconomyTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Cost.total(),
          Container(height: 80),
          Cost.today(),
        ],
      ),
    );
  }
}
