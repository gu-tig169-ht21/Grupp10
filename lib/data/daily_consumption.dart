class DailyConsumption {
  int count = 0;

  DailyConsumption();

  DailyConsumption.fromJson(Map<String, dynamic>? json)
      : count = json?['count'] as int;
}
