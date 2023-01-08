import 'package:flutter/material.dart';

class AirtableDataEducation {
  String id;
  String createdTime;
  String title;
  String detail;
  String imageLink;

  AirtableDataEducation({
    required this.id,
    required this.createdTime,
    required this.title,
    required this.detail,
    required this.imageLink
  });
}