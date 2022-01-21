import 'package:flutter/foundation.dart';
import 'package:dart_airtable/dart_airtable.dart';
import 'package:cv_flutter/utils/Config.dart';

// unused
class MyAirTable {
  Future<void> getProfil() async{
    var airtable = Airtable(apiKey: Config.apiKey, projectBase: Config.projectBase);
    var records = await airtable.getAllRecords(Config.profilTable);
    if (kDebugMode) {
      print(records);
      records.forEach((element) {
        print(element.getField("content")?.value);
      });
    }
  }
}