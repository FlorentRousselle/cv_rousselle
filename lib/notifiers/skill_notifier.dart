import 'package:cv_flutter/models/tables/air_table_data_experience.dart';
import 'package:cv_flutter/models/tables/air_table_data_skill.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final skillProvider = ChangeNotifierProvider((ref) {
  return SkillNotifier();
});


class SkillNotifier with ChangeNotifier {
  Future<List<AirtableDataSkill>> initSkillData() async {
    return Global.airTableService.getSkill();
  }
}