import 'package:flutter/material.dart';

class AirtableDataInfo {
  String id;
  String createdTime;
  String title;
  String detail;
  Image InfoImage;

  AirtableDataInfo({
    required this.id,
    required this.createdTime,
    required this.title,
    required this.detail,
    required this.InfoImage
  });
}