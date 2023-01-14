class AirtableDataProfil {
  String title;
  String details;
  String icon;
  String type;

  AirtableDataProfil({
    required this.type,
    required this.title,
    required this.details,
    required this.icon,
  });

  factory AirtableDataProfil.fromJson(Map<String, dynamic> json) {
    return AirtableDataProfil(
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
