import 'package:cv_flutter/models/air_table_data_education.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final educationProvider = ChangeNotifierProvider((ref) {
  return EducationNotifier();
});


class EducationNotifier with ChangeNotifier {
  Future<List<AirtableDataEducation>> initEducationData() async {
    return Global.airTableService.getEducation();
  }
}