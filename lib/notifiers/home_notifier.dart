import 'package:cv_flutter/models/tables/air_table_data_education.dart';
import 'package:cv_flutter/models/tables/air_table_data_experience.dart';
import 'package:cv_flutter/models/tables/air_table_data_info.dart';
import 'package:cv_flutter/models/tables/air_table_data_profil.dart';
import 'package:cv_flutter/models/tables/air_table_data_skill.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:cv_flutter/widgets/menus/education_menu.dart';
import 'package:cv_flutter/widgets/menus/experience_menu.dart';
import 'package:cv_flutter/widgets/menus/info_menu.dart';
import 'package:cv_flutter/widgets/menus/profil_menu.dart';
import 'package:cv_flutter/widgets/menus/skill_menu.dart';
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
    listEducation = await Global.airTableService.getEducation();
    listExperience = await Global.airTableService.getExperience();
    listInfo = await Global.airTableService.getInfo();
    listProfil = await Global.airTableService.getProfil();
    listSkill = await Global.airTableService.getSkill();
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
      0: ProfilMenu(homeNotifier: homeNotifier, isWeb: isWeb),
      1: ExperienceMenu(homeNotifier: homeNotifier, isWeb: isWeb),
      2: EducationMenu(homeNotifier: homeNotifier, isWeb: isWeb),
      3: SkillMenu(homeNotifier: homeNotifier, isWeb: isWeb),
      4: InfoMenu(homeNotifier: homeNotifier, isWeb: isWeb),
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
