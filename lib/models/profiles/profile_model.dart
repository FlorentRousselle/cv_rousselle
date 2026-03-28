import 'package:cv_flutter/models/profiles/profile_info_model.dart';

class ProfileModel {
  String title;
  String detail;
  bool fillSpace;
  bool centerInfo;
  List<ProfileInfoModel> listProfileInfo;

  bool get hasDetail => detail.isNotEmpty;

  ProfileModel({
    required this.title,
    this.detail = "",
    this.fillSpace = false,
    this.centerInfo = false,
    this.listProfileInfo = const [],
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> listInfoJson = json['listInfo'] as List<dynamic>;

    final List<ProfileInfoModel> listInfo =
        listInfoJson
            .map((dynamic json) => ProfileInfoModel.fromJson(json))
            .toList();

    return ProfileModel(
      title: json['title'],
      detail: json['detail'],
      fillSpace: json['fillSpace'],
      centerInfo: json['centerInfo'],
      listProfileInfo: listInfo,
    );
  }

  Map<String, dynamic> toJson() {
    final List<Map<String, dynamic>> listProfileInfoJson =
        listProfileInfo.map((ProfileInfoModel info) => info.toJson()).toList();
    return <String, dynamic>{
      'title': title,
      'detail': detail,
      'fillSpace': fillSpace,
      'centerInfo': centerInfo,
      'listInfo': listProfileInfoJson,
    };
  }
}
