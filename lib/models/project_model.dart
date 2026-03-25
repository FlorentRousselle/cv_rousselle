// class ProjectModel {
//   String title;
//   String function;
//   String period;
//   String contract;
//   String details;
//   String image;
//
//   ProjectModel({
//     required this.title,
//     required this.function,
//     required this.details,
//     required this.contract,
//     required this.period,
//     required this.image
//   });
//
//   factory ProjectModel.fromJson(Map<String, dynamic> json) {
//     return ProjectModel(
//       title: json['title'],
//       function: json['function'],
//       details: json['details'],
//       contract: json['contract'],
//       period: json['period'],
//       image: json['image'][0]['url'],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     'title': title,
//     'function': function,
//     'details': details,
//     'contract': contract,
//     'period': period,
//     'image': image,
//   };
// }