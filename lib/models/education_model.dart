// class EducationModel {
//   String diploma;
//   String school;
//   String date;
//   String details;
//   String image;
//
//   EducationModel({
//     required this.diploma,
//     required this.school,
//     required this.details,
//     required this.date,
//     required this.image,
//   });
//
//   factory EducationModel.fromJson(Map<String, dynamic> json) {
//     return EducationModel(
//       diploma: json['diploma'],
//       school: json['school'],
//       details: json['details'],
//       date: json['date'],
//       image: json['image'][0]['url'],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//         'diploma': diploma,
//         'school': school,
//         'details': details,
//         'date': date,
//         'image': image,
//       };
// }
