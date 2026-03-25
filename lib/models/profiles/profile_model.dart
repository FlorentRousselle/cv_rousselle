import 'package:cv_flutter/models/profiles/info_profile_model.dart';

class ProfileModel {
  String title;
  String detail;
  bool fillSpace;
  bool centerInfo;
  List<InfoProfileModel> listInfoProfile;

  bool get hasDetail => detail.isNotEmpty;

  ProfileModel({
    required this.title,
    this.detail = "",
    this.fillSpace = false,
    this.centerInfo = false,
    this.listInfoProfile = const [],
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    // convert JSON list to List<Licence>
    final List<dynamic> listInfoJson = json['listInfo'] as List<dynamic>;

    final List<InfoProfileModel> listInfo =
        listInfoJson
            .map((dynamic json) => InfoProfileModel.fromJson(json))
            .toList();

    return ProfileModel(
      title: json['title'],
      detail: json['detail'],
      fillSpace: json['fillSpace'],
      centerInfo: json['centerInfo'],
      listInfoProfile: listInfo,
    );
  }

  Map<String, dynamic> toJson() {
    final List<Map<String, dynamic>> listInfoProfileJson =
        listInfoProfile
            .map((InfoProfileModel infoProfile) => infoProfile.toJson())
            .toList();
    return <String, dynamic>{
      'title': title,
      'detail': detail,
      'fillSpace': fillSpace,
      'centerInfo': centerInfo,
      'listInfo': listInfoProfileJson,
    };
  }
}
