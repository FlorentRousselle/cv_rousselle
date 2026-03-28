class SkillModel {
  String title;
  String imageLink;
  String category;
  int rating;

  SkillModel({
    required this.title,
    required this.imageLink,
    required this.rating,
    this.category = "Hors catégorie",
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    int rating = json['rating'];
    if (rating < 0) {
      rating = 0;
    } else if (rating > 5) {
      rating = 5;
    }
    return SkillModel(
      title: json['title'],
      imageLink: json['imageLink'],
      rating: json['rating'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'imageLink': imageLink,
      'rating': rating,
      'category': category,
    };
  }
}
