import 'package:flutter/material.dart';
import 'package:my_first_app/provider/pouch_provider.dart';
import 'package:provider/provider.dart';

import 'kostnad.dart';

class EkonomiTab extends StatelessWidget {
  const EkonomiTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PouchProvider>(context, listen: false);
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
