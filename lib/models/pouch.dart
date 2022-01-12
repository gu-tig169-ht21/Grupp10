class Pouch {
  final DateTime date;

  Pouch(this.date);

  Pouch.fromJson(Map<String, dynamic> json)
      : date = DateTime.parse(json['date'] as String);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'date': date.toString(),
      };
}
