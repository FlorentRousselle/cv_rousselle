import 'package:cv_flutter/models/tables/air_table_data_experience.dart';
import 'package:cv_flutter/models/tables/air_table_data_info.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final infoProvider = ChangeNotifierProvider((ref) {
  return InfoNotifier();
});


class InfoNotifier with ChangeNotifier {
  Future<List<AirtableDataInfo>> initInfoData() async {
    return Global.airTableService.getInfo();
  }
}