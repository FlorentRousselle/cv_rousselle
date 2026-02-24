class AirtableDataEducation {
  String diploma;
  String school;
  String date;
  String details;
  String image;

  AirtableDataEducation({
    required this.diploma,
    required this.school,
    required this.details,
    required this.date,
    required this.image,
  });

  factory AirtableDataEducation.fromJson(Map<String, dynamic> json) {
    return AirtableDataEducation(
      diploma: json['diploma'],
      school: json['school'],
      details: json['details'],
      date: json['date'],
      image: json['image'][0]['url'],
    );
  }

  Map<String, dynamic> toJson() => {
        'diploma': diploma,
        'school': school,
        'details': details,
        'date': date,
        'image': image,
      };
}
