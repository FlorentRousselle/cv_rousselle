import 'dart:ui';

class AirtableDataExperience {
  String id;
  String createdTime;
  String title;
  String function;
  String period;
  String detail;
  Image logo;

  AirtableDataExperience({
    required this.id,
    required this.createdTime,
    required this.title,
    required this.function,
    required this.detail,
    required this.period,
    required this.logo
  });
}