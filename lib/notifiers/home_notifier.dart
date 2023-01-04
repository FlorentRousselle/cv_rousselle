import 'package:cv_flutter/models/air_table_data_education.dart';
import 'package:cv_flutter/models/air_table_data_experience.dart';
import 'package:cv_flutter/models/air_table_data_info.dart';
import 'package:cv_flutter/models/air_table_data_profil.dart';
import 'package:cv_flutter/models/air_table_data_skill.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = ChangeNotifierProvider((ref) {
  return HomeNotifier();
});

class HomeNotifier with ChangeNotifier {
  List<AirtableDataEducation>? listEducation;
  List<AirtableDataExperience>? listExperience;
  List<AirtableDataInfo>? listInfo;
  List<AirtableDataProfil>? listProfil;
  List<AirtableDataSkill>? listSkill;

  bool isDataLoading() =>
      listEducation == null &&
      listExperience == null &&
      listInfo == null &&
      listProfil == null &&
      listSkill == null;

  Future<void> initData() async {
    listEducation = await Global.airTableService.getEducation();
    listExperience = await Global.airTableService.getExperience();
    listInfo = await Global.airTableService.getInfo();
    listProfil = await Global.airTableService.getProfil();
    listSkill = await Global.airTableService.getSkill();
    notifyListeners();
  }
}
