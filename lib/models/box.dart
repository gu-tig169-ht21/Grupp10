import 'package:cloud_firestore/cloud_firestore.dart';

class Box {
  String name;
  int price;
  int pouches;
  DocumentReference ref;

  Box(this.name, this.price, this.pouches, this.ref);

  Box.fromJson(Map<String, dynamic> json, this.ref)
      : name = json['name'] as String,
        price = json['price'] as int,
        pouches = json['pouches'] as int;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'price': price,
        'pouches': pouches,
      };
}
