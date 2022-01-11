import 'package:flutter/material.dart';

import 'kostnad_idag.dart';
import 'kostnad_totalt.dart';

class EkonomiTab extends StatelessWidget {
  const EkonomiTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          KostnadTotalt(),
          Container(height: 80),
          KostnadIdag(),
        ],
      ),
    );
  }
}
