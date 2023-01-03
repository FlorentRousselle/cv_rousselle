import 'package:cv_flutter/models/air_table_data_profil.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profilProvider = ChangeNotifierProvider((ref) {
  return ProfilNotifier();
});


class ProfilNotifier with ChangeNotifier {
  Future<List<AirtableDataProfil>> initProfilData() async {
    return Global.airTableService.getProfil();
  }
}