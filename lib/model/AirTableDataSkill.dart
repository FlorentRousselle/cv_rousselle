import 'package:flutter/material.dart';

class AirtableDataSkill {
  String id;
  String createdTime;
  String category;
  List<Image> logos;

  AirtableDataSkill({
    required this.id,
    required this.createdTime,
    required this.category,
    required this.logos
  });
}