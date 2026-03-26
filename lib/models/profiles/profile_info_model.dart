class ProfileInfoModel {
  String title;
  String text;
  String imageLink;
  String urlLink;

  bool get hasImage => imageLink.isNotEmpty;

  bool get hasLink => urlLink.isNotEmpty;

  bool get hasTitle => title.isNotEmpty;

  ProfileInfoModel({
    this.title = "",
    required this.text,
    this.imageLink = "",
    this.urlLink = "",
  });

  factory ProfileInfoModel.fromJson(Map<String, dynamic> json) {
    return ProfileInfoModel(
      title: json['title'],
      text: json['text'],
      imageLink: json['imageLink'],
      urlLink: json['urlLink'],
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'text': text,
    'imageLink': imageLink,
    'urlLink': urlLink,
  };
}
