import 'package:cv_flutter/models/airtable_info_model.dart';
import 'package:cv_flutter/models/tables/air_table_data_education.dart';
import 'package:cv_flutter/models/tables/air_table_data_experience.dart';
import 'package:cv_flutter/models/tables/air_table_data_info.dart';
import 'package:cv_flutter/models/tables/air_table_data_profil.dart';
import 'package:cv_flutter/models/tables/air_table_data_skill.dart';
import 'package:cv_flutter/resources/global_resources.dart';
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

  AirtableInfoModel profilInfo = AirtableInfoModel(
    title: "Profil",
    icon: Global.profilSvg,
    key: const Key("profil"),
  );

  AirtableInfoModel experienceInfo = AirtableInfoModel(
    title: "Expériences",
    icon: Global.experienceSvg,
    key: const Key("experience"),
  );

  AirtableInfoModel formationInfo = AirtableInfoModel(
    title: "Formations",
    icon: Global.formationSvg,
    key: const Key("formation"),
  );

  AirtableInfoModel skillInfo = AirtableInfoModel(
    title: "Compétences",
    icon: Global.skillSvg,
    key: const Key("skill"),
  );

  AirtableInfoModel projectInfo = AirtableInfoModel(
    title: "Mes projets",
    icon: Global.projectSvg,
    key: const Key("project"),
  );

  final scrollController = ItemScrollController();
  int currentIndex = 0;

  bool isCurrentIndexVisible = true;

  bool isDataLoading() =>
      listEducation == null &&
      listExperience == null &&
      listInfo == null &&
      listProfil == null &&
      listSkill == null;

  Future<void> initData() async {
    listProfil = await AirTableService.getProfil();
    listExperience = await AirTableService.getExperience();
    listEducation = await AirTableService.getEducation();
    listSkill = await AirTableService.getSkill();
    listInfo = await AirTableService.getInfo();
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

  AirtableInfoModel getInfo(int index) {
    Map<int, AirtableInfoModel> mapIndex = {
      0: profilInfo,
      1: experienceInfo,
      2: formationInfo,
      3: skillInfo,
      4: profilInfo,
    };

    return mapIndex[index] ?? profilInfo;
  }
}
