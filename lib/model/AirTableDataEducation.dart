import 'package:flutter/material.dart';

class AirtableDataEducation {
  String id;
  String createdTime;
  String title;
  String detail;
  Image educationImage;

  AirtableDataEducation({
    required this.id,
    required this.createdTime,
    required this.title,
    required this.detail,
    required this.educationImage
  });
}