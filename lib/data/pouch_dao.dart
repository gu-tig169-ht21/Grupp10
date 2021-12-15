import 'package:firebase_database/firebase_database.dart';
import 'pouch.dart';

class PouchDao {
  final DatabaseReference _pouchesRef =
      FirebaseDatabase.instance.ref().child('pouches');

  void savePouch(Pouch pouch) {
    _pouchesRef.push().set(pouch.toJson());
  }
}
