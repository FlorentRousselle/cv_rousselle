import 'dart:convert';

import 'package:cv_flutter/model/AirTableDataProfil.dart';
import 'package:cv_flutter/utils/Config.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AirTableHttp {
  final Uri urlProfil = Uri.https(
    "api.airtable.com",
    "/v0/${Config.projectBase}/profil",
    {"maxRecords": "10", "view": "Grid view"},
  );

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
            ),
          )
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }

  Future<List<AirtableDataProfil>> getExperience() async {
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
            ),
          )
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }
}