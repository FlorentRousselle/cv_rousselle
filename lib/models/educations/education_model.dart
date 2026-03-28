import 'package:cv_flutter/models/experiences/experience_info_model.dart';

class EducationModel {
  String title;
  String location;
  int year;
  String schoolImage;
  List<String> listActivity;

  bool get hasCompanyImage => schoolImage.isNotEmpty;

  bool get hasListActivity => listActivity.isNotEmpty;

  EducationModel({
    required this.title,
    required this.location,
    required this.year,
    this.schoolImage = "",
    this.listActivity = const [],
  });

  factory EducationModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> listActivityJson =
        json['listActivity'] as List<dynamic>;

    final List<String> listActivity =
        listActivityJson.map((dynamic json) => json.toString()).toList();

    return EducationModel(
      title: json['title'],
      location: json['location'],
      schoolImage: json['schoolImage'],
      year: json['year'],
      listActivity: listActivity,
    );
  }

  Map<String, dynamic> toJson() {
    final List<String> listActivityJson =
        listActivity.map((String activity) => activity).toList();
    return <String, dynamic>{
      'title': title,
      'location': location,
      'year': year,
      'schoolImage': schoolImage,
      'listActivity': listActivityJson,
    };
  }
}
