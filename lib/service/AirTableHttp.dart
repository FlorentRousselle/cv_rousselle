import 'dart:convert';

import 'package:cv_flutter/model/AirTableDataEducation.dart';
import 'package:cv_flutter/model/AirTableDataExperience.dart';
import 'package:cv_flutter/model/AirTableDataProfil.dart';
import 'package:cv_flutter/model/AirTableDataSkill.dart';
import 'package:cv_flutter/utils/Config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

///
/// service to access to Airtable Database
///
class AirTableHttp {
  final Uri urlProfil = Uri.https(
    "api.airtable.com",
    "/v0/${Config.projectBase}/profil",
    {"maxRecords": "10", "view": "Grid view"},
  );

  final Uri urlExperience = Uri.https(
    "api.airtable.com",
    "/v0/${Config.projectBase}/experience",
    {"maxRecords": "10", "view": "Grid view"},
  );

  final Uri urlSkill = Uri.https(
    "api.airtable.com",
    "/v0/${Config.projectBase}/skill",
    {"maxRecords": "10", "view": "Grid view"},
  );

  final Uri urlEducation = Uri.https(
    "api.airtable.com",
    "/v0/${Config.projectBase}/education",
    {"maxRecords": "10", "view": "Grid view"},
  );

  ///
  /// Get profil data
  /// model : AirTableDataProfil
  ///
  Future<List<AirtableDataProfil>> getProfil() async {
    final res = await http.get(
      urlProfil,
      headers: {"Authorization": "Bearer ${Config.apiKey}"},
    );

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      if (kDebugMode) {
        print(data);
      }

      List<AirtableDataProfil> values = [];
      data.forEach(
            (value) => {
          values.add(
            AirtableDataProfil(
              id: value['id'],
              createdTime: value['createdTime'],
              content: value['fields']['content'],
              icon: value['fields']['icon'],
              type: value['fields']['type']
            ),
          )
        },
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
  Future<List<AirtableDataExperience>> getExperience() async {
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
              Image img = Image.network(value['fields']['logo'][0]['url']);
          return values.add(
            AirtableDataExperience(
              id: value['id'],
              createdTime: value['createdTime'],
              title: value['fields']['title'],
              detail: value['fields']['details'],
              function: value['fields']['function'],
              logoImage: img,
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
  Future<List<AirtableDataSkill>> getSkill() async {
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
              List<Image> tempListImage = [];
              dynamic skills =  value['fields']['skills'];
              skills.forEach((skill) {
                Image img = Image.network(skill['url']);
                tempListImage.add(img);
              });
          return values.add(
            AirtableDataSkill(
              id: value['id'],
              createdTime: value['createdTime'],
              category: value['fields']['category'],
              skillImages: tempListImage,
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
  Future<List<AirtableDataEducation>> getEducation() async {
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
          Image img = Image.network(value['fields']['image'][0]['url']);
          return values.add(
            AirtableDataEducation(
              id: value['id'],
              createdTime: value['createdTime'],
              title: value['fields']['title'],
              detail: value['fields']['details'],
              educationImage: img
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