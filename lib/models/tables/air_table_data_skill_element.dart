class AirtableDataSkillElement {
  String title;
  int note;
  String type;
  String image;

  AirtableDataSkillElement({
    required this.title,
    required this.note,
    required this.type,
    required this.image
  });

  factory AirtableDataSkillElement.fromJson(Map<String, dynamic> json) {
    return AirtableDataSkillElement(
      title: json['title'],
      note: json['note'],
      type: json['type'],
      image: json['image']['url'],
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'note': note,
    'type': type,
    'image': image,
  };
}