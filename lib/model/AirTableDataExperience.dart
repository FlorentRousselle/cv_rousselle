import 'package:flutter/material.dart';

class AirtableDataExperience {
  String id;
  String createdTime;
  String title;
  String function;
  String period;
  String detail;
  Image logoImage;

  AirtableDataExperience({
    required this.id,
    required this.createdTime,
    required this.title,
    required this.function,
    required this.detail,
    required this.period,
    required this.logoImage
  });
}