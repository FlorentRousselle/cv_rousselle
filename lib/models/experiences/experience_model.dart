import 'package:cv_flutter/models/experiences/experience_info_model.dart';

class ExperienceModel {
  String title;
  String location;
  int startYear;
  int endYear;
  String companyImage;
  List<String> listActivity;
  List<ExperienceInfoModel> listExperienceInfo;

  bool get hasCompanyImage => companyImage.isNotEmpty;

  bool get hasListActivity => listActivity.isNotEmpty;

  bool get hasListInfoExperience => listExperienceInfo.isNotEmpty;

  ExperienceModel({
    required this.title,
    required this.location,
    required this.startYear,
    required this.endYear,
    this.companyImage = "",
    this.listActivity = const [],
    this.listExperienceInfo = const [],
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> listActivityJson =
        json['listActivity'] as List<dynamic>;

    final List<String> listActivity =
        listActivityJson.map((dynamic json) => json.toString()).toList();

    final List<dynamic> listInfoJson = json['listInfo'] as List<dynamic>;

    final List<ExperienceInfoModel> listInfo =
        listInfoJson
            .map((dynamic json) => ExperienceInfoModel.fromJson(json))
            .toList();

    return ExperienceModel(
      title: json['title'],
      location: json['location'],
      companyImage: json['companyImage'],
      listActivity: listActivity,
      listExperienceInfo: listInfo,
      startYear: json['startYear'],
      endYear: json['endYear'],
    );
  }

  Map<String, dynamic> toJson() {
    final List<String> listActivityJson =
        listActivity.map((String activity) => activity).toList();
    final List<Map<String, dynamic>> listExperienceInfoJson =
        listExperienceInfo
            .map((ExperienceInfoModel info) => info.toJson())
            .toList();
    return <String, dynamic>{
      'title': title,
      'location': location,
      'startYear': startYear,
      'endYear': endYear,
      'companyImage': companyImage,
      'listActivity': listActivityJson,
      'listInfo': listExperienceInfoJson,
    };
  }
}
