import 'package:cv_flutter/models/air_table_data_education.dart';
import 'package:cv_flutter/models/air_table_data_experience.dart';
import 'package:cv_flutter/models/air_table_data_info.dart';
import 'package:cv_flutter/models/air_table_data_profil.dart';
import 'package:cv_flutter/models/air_table_data_skill.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

final homeProvider = ChangeNotifierProvider((ref) {
  return HomeNotifier();
});

class HomeNotifier with ChangeNotifier {
  List<AirtableDataEducation>? listEducation;
  List<AirtableDataExperience>? listExperience;
  List<AirtableDataInfo>? listInfo;
  List<AirtableDataProfil>? listProfil;
  List<AirtableDataSkill>? listSkill;

  int currentIndex = 1;

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

  void visibilityChanged(VisibilityInfo info, int index) {
    currentIndex = index;
    notifyListeners();
  }

  void onTabTapped(int index) {
    /*
    switch (index) {
      case 0:
        title = "Florent Rousselle";
        iconVisibility = false;
        break;
      case 1:
        title = "Expériences";
        iconVisibility = true;
        break;
      case 2:
        title = "Formations";
        iconVisibility = true;
        break;
      case 3:
        title = "Compétences";
        iconVisibility = true;
        break;
      case 4:
        title = "Infos";
        iconVisibility = true;
        break;
    }
     */
    currentIndex = index;
  }
}
