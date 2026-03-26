class ExperienceInfoModel {
  String title;
  String description;
  String imageLink;
  String urlLink;

  bool get hasImage => imageLink.isNotEmpty;

  bool get hasLink => urlLink.isNotEmpty;

  bool get hasDescription => description.isNotEmpty;

  ExperienceInfoModel({
    required this.title,
    this.description = "",
    this.imageLink = "",
    this.urlLink = "",
  });

  factory ExperienceInfoModel.fromJson(Map<String, dynamic> json) {
    return ExperienceInfoModel(
      title: json['title'],
      description: json['description'],
      imageLink: json['imageLink'],
      urlLink: json['urlLink'],
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'imageLink': imageLink,
    'urlLink': urlLink,
  };
}
