import 'package:cv_flutter/models/tables/air_table_data_education.dart';
import 'package:cv_flutter/models/tables/air_table_data_experience.dart';
import 'package:cv_flutter/models/tables/air_table_data_info.dart';
import 'package:cv_flutter/models/tables/air_table_data_profil.dart';
import 'package:cv_flutter/models/tables/air_table_data_skill.dart';
import 'package:cv_flutter/services/air_table_service.dart';
import 'package:cv_flutter/widgets/datas/education_data_widget.dart';
import 'package:cv_flutter/widgets/datas/experience_data_widget.dart';
import 'package:cv_flutter/widgets/datas/info_data_widget.dart';
import 'package:cv_flutter/widgets/datas/profil_data_widget.dart';
import 'package:cv_flutter/widgets/datas/skill_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
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

  final scrollController = ItemScrollController();
  int currentIndex = 0;

  bool isDataLoading() =>
      listEducation == null &&
      listExperience == null &&
      listInfo == null &&
      listProfil == null &&
      listSkill == null;

  Future<void> initData() async {
    listProfil = await AirTableService.getProfil();
    listEducation = [];
    listExperience = [];
    listInfo = [];
    listSkill = [];
    // listEducation = await AirTableService.getEducation();
    // listExperience = await AirTableService.getExperience();
    // listInfo = await AirTableService.getInfo();
    // listSkill = await AirTableService.getSkill();
    notifyListeners();
  }

  void visibilityChanged(VisibilityInfo info, int index) {
    if (info.visibleFraction == 1) {
      currentIndex = index;
      notifyListeners();
    }
  }

  void webGoToIndex(int index) {
    scrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 500),
    );
    notifyListeners();
  }

  void mobileGoToIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Widget getScreen(int index, HomeNotifier homeNotifier, bool isWeb) {
    Map<int, Widget> mapIndex = {
      0: ProfilDataWidget(homeNotifier: homeNotifier, isWeb: isWeb),
      1: ExperienceDataWidget(homeNotifier: homeNotifier, isWeb: isWeb),
      2: EducationData(homeNotifier: homeNotifier, isWeb: isWeb),
      3: SkillDataWidget(homeNotifier: homeNotifier, isWeb: isWeb),
      4: InfoDataWidget(homeNotifier: homeNotifier, isWeb: isWeb),
    };

    return mapIndex[index] ?? const Center();
  }

  String getTitle(int index) {
    Map<int, String> mapIndex = {
      0: "Profil",
      1: "Expériences",
      2: "Formations",
      3: "Compétences",
      4: "Mes projets",
    };

    return mapIndex[index] ?? "";
  }
}
