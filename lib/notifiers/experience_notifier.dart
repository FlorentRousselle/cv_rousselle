import 'package:cv_flutter/models/air_table_data_experience.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final experienceProvider = ChangeNotifierProvider((ref) {
  return ExperienceNotifier();
});


class ExperienceNotifier with ChangeNotifier {
  Future<List<AirtableDataExperience>> initExperienceData() async {
    return Global.airTableService.getExperience();
  }
}