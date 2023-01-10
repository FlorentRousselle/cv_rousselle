import 'dart:convert';

import 'package:cv_flutter/models/tables/air_table_data_education.dart';
import 'package:cv_flutter/models/tables/air_table_data_experience.dart';
import 'package:cv_flutter/models/tables/air_table_data_info.dart';
import 'package:cv_flutter/models/tables/air_table_data_profil.dart';
import 'package:cv_flutter/models/tables/air_table_data_skill.dart';
import 'package:cv_flutter/utils/config.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

///
/// service to access to Airtable Database
///
class AirTableService {
  static final Uri urlProfil = Uri.https(
    "api.airtable.com",
    "/v0/${Config.projectBase}/profil",
    {"maxRecords": "10", "view": "Grid view"},
  );

  static final Uri urlExperience = Uri.https(
    "api.airtable.com",
    "/v0/${Config.projectBase}/experience",
    {"maxRecords": "10", "view": "Grid view"},
  );

  static final Uri urlSkill = Uri.https(
    "api.airtable.com",
    "/v0/${Config.projectBase}/skill",
    {"maxRecords": "10", "view": "Grid view"},
  );

  static final Uri urlEducation = Uri.https(
    "api.airtable.com",
    "/v0/${Config.projectBase}/education",
    {"maxRecords": "10", "view": "Grid view"},
  );

  static final Uri urlInfo = Uri.https(
    "api.airtable.com",
    "/v0/${Config.projectBase}/info",
    {"maxRecords": "10", "view": "Grid view"},
  );

  ///
  /// Get profil data
  /// model : AirTableDataProfil
  ///
  static Future<List<AirtableDataProfil>> getProfil() async {
    final res = await http.get(
      urlProfil,
      headers: {"Authorization": "Bearer ${Config.apiKey}"},
    );

    if (res.statusCode == 200) {
      // if (kDebugMode) {
      //   print("PROFIL");
      //   print(res.body);
      // }

      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      List<AirtableDataProfil> values = [];
      data.forEach(
        (jsonValue) => values.add(
          AirtableDataProfil.fromJson(jsonValue['fields']),
        ),
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }

  ///
  /// Get experience data
  /// model : AirTableDataExperience
  ///
  static Future<List<AirtableDataExperience>> getExperience() async {
    final res = await http.get(
      urlExperience,
      headers: {"Authorization": "Bearer ${Config.apiKey}"},
    );

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      if (kDebugMode) {
        print(data);
      }

      List<AirtableDataExperience> values = [];
      data.forEach(
        (value) {
          return values.add(
            AirtableDataExperience(
              id: value['id'],
              createdTime: value['createdTime'],
              title: value['fields']['title'],
              detail: value['fields']['details'],
              function: value['fields']['function'],
              imageLink: value['fields']['logo'][0]['url'],
              period: value['fields']['period'],
            ),
          );
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }

  ///
  /// Get skills data
  /// model : AirTableDataSkill
  ///
  static Future<List<AirtableDataSkill>> getSkill() async {
    final res = await http.get(
      urlSkill,
      headers: {"Authorization": "Bearer ${Config.apiKey}"},
    );

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      if (kDebugMode) {
        print(data);
      }

      List<AirtableDataSkill> values = [];
      data.forEach(
        (value) {
          List<String> tempListSkills = [];
          List skills = value['fields']['skills'];
          for (var skill in skills) {
            tempListSkills.add(skill['url']);
          }
          return values.add(
            AirtableDataSkill(
              id: value['id'],
              createdTime: value['createdTime'],
              category: value['fields']['category'],
              listImageLink: tempListSkills,
            ),
          );
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }

  ///
  /// Get education data
  /// model : AirTableDataEducation
  ///
  static Future<List<AirtableDataEducation>> getEducation() async {
    final res = await http.get(
      urlEducation,
      headers: {"Authorization": "Bearer ${Config.apiKey}"},
    );

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      if (kDebugMode) {
        print(data);
      }

      List<AirtableDataEducation> values = [];
      data.forEach(
        (value) {
          return values.add(
            AirtableDataEducation(
              id: value['id'],
              createdTime: value['createdTime'],
              title: value['fields']['title'],
              detail: value['fields']['details'],
              imageLink: value['fields']['image'][0]['url'],
            ),
          );
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }

  ///
  /// Get info data
  /// model : AirTableDataInfo
  ///
  static Future<List<AirtableDataInfo>> getInfo() async {
    final res = await http.get(
      urlInfo,
      headers: {"Authorization": "Bearer ${Config.apiKey}"},
    );

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      if (kDebugMode) {
        print(data);
      }

      List<AirtableDataInfo> values = [];
      data.forEach(
        (value) {
          return values.add(
            AirtableDataInfo(
              id: value['id'],
              createdTime: value['createdTime'],
              title: value['fields']['title'],
              detail: value['fields']['text'],
              imageLink: value['fields']['image'][0]['url'],
            ),
          );
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }
}
