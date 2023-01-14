import 'package:cv_flutter/models/tables/air_table_data_skill_element.dart';

class AirtableDataSkill {
  String category;
  List<AirtableDataSkillElement> skillElements;

  AirtableDataSkill({
    required this.category,
    required this.skillElements,
  });

  factory AirtableDataSkill.fromJson(Map<String, dynamic> json) {
    List<AirtableDataSkillElement> listSkillElement = [];
    if (json['skills'] != null) {
      int cpt = 0;
      json['skills'].forEach((v) {
        Map<String, dynamic> map = {
          "title": json['title'][cpt],
          "note": json['note'][cpt],
          "type": json['type'][cpt],
          "image": json['image'][cpt],
        };
        listSkillElement.add(AirtableDataSkillElement.fromJson(map));
        cpt++;
      });
    }
    return AirtableDataSkill(
      category: json['category'],
      skillElements: listSkillElement,
    );
  }

  Map<String, dynamic> toJson() => {
        'category': category,
        'skills': skillElements.map((v) => v.toJson()).toList(),
      };
}
