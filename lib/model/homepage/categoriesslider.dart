
class CategoriesSlider {
  CategoriesSlider({
    this.id,
    this.link,
    this.image,
    this.name,});

  CategoriesSlider.fromJson(dynamic json) {
    id = json['id'];
    link = json['link'];
    image = json['image'];
    name = json['name'];
  }
  int? id;
  String? link;
  String? image;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['link'] = link;
    map['image'] = image;
    map['name'] = name;
    return map;
  }

}
