class AirtableDataInfo {
  String title;
  String link;
  String details;
  String image;

  AirtableDataInfo({
    required this.title,
    required this.link,
    required this.details,
    required this.image,
  });

  factory AirtableDataInfo.fromJson(Map<String, dynamic> json) {
    return AirtableDataInfo(
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