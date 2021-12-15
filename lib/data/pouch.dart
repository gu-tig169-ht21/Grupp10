class Pouch {
  final String user;
  final DateTime date;

  Pouch(this.user, this.date);

  Pouch.fromJson(Map<dynamic, dynamic> json)
      : date = DateTime.parse(json['date'] as String),
        user = json['user'] as String;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'date': date.toString(),
        'user': user,
      };
}
