class ProjectModel {
  String title;
  String imageLink;
  String urlLink;
  List<String> listDetail;

  bool get hasImage => imageLink.isNotEmpty;

  bool get hasLink => urlLink.isNotEmpty;

  bool get hasListDetail => listDetail.isNotEmpty;

  ProjectModel({
    required this.title,
    this.imageLink = "",
    this.urlLink = "",
    this.listDetail = const [],
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> listDetailJson = json['listDetail'] as List<dynamic>;

    final List<String> listDetail =
        listDetailJson.map((dynamic json) => json.toString()).toList();

    return ProjectModel(
      title: json['title'],
      imageLink: json['imageLink'],
      urlLink: json['urlLink'],
      listDetail: listDetail,
    );
  }

  Map<String, dynamic> toJson() {
    final List<String> listDetailJson =
        listDetail.map((String activity) => activity).toList();
    return <String, dynamic>{
      'title': title,
      'imageLink': imageLink,
      'urlLink': urlLink,
      'listDetail': listDetailJson,
    };
  }
}
