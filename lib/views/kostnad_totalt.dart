import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/provider/pouch_provider.dart';

class KostnadTotalt extends StatelessWidget {
  const KostnadTotalt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PouchProvider>(context, listen: false);
    return Column(
      children: [
        const Text('Pengar du spenderat på snus sedan start',
            style: TextStyle(color: Colors.white, fontSize: 12)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${provider.countTotal * provider.selectedBox!.price}',
              style: const TextStyle(
                color: Color(0xff699985),
                fontSize: 50.0,
              ),
            ),
            const SizedBox(width: 5),
            const Text('kr',
                style: TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
      ],
    );
  }
}
