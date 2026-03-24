class InfoModel {
  String title;
  String link;
  String details;
  String image;

  InfoModel({
    required this.title,
    required this.link,
    required this.details,
    required this.image,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      title: json['title'],
      link: json['link'],
      details: json['details'],
      image: json['image'][0]['url'],
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'link': link,
    'details': details,
    'image': image,
  };
}