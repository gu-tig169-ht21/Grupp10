import 'package:cloud_firestore/cloud_firestore.dart';

class Box {
  String name;
  int price;
  DocumentReference ref;

  Box(this.name, this.price, this.ref);

  Box.fromJson(Map<String, dynamic> json, this.ref)
      : name = json['name'] as String,
        price = json['price'] as int;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'price': price,
      };
}
