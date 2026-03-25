class InfoProfileModel {
  String title;
  String text;
  String icon;
  String urlLink;

  bool get hasIcon => icon.isNotEmpty;

  bool get hasLink => urlLink.isNotEmpty;

  bool get hasTitle => title.isNotEmpty;

  InfoProfileModel({
    this.title = "",
    required this.text,
    this.icon = "",
    this.urlLink = "",
  });

  factory InfoProfileModel.fromJson(Map<String, dynamic> json) {
    return InfoProfileModel(
      title: json['title'],
      text: json['text'],
      icon: json['icon'],
      urlLink: json['urlLink'],
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'text': text,
    'icon': icon,
    'urlLink': urlLink,
  };
}
