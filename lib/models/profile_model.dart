class ProfileModel {
  String title;
  String details;
  String icon;
  String type;

  ProfileModel({
    required this.type,
    required this.title,
    required this.details,
    required this.icon,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      type: json['type'],
      title: json['title'],
      details: json['details'],
      icon: json['icon'][0]['url'],
    );
  }

  Map<String, dynamic> toJson() => {
    'type': type,
    'title': title,
    'details': details,
    'icon': icon,
  };
}
