import 'package:flutter/material.dart';
import '../../widgets/kostnad.dart';

class EkonomiTab extends StatelessWidget {
  const EkonomiTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Kostnad.totalt(),
          Container(height: 80),
          Kostnad.idag(),
        ],
      ),
    );
  }
}
