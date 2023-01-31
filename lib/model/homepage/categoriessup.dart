
class CategoriesSup {
  CategoriesSup({
    this.id,
    this.parentId,
    this.image,
    this.imageHome,
    this.name,
    this.describe,});

  CategoriesSup.fromJson(dynamic json) {
    id = json['id'];
    parentId = json['parent_id'];
    image = json['image'];
    imageHome = json['image_home'];
    name = json['name'];
    describe = json['describe'];
  }
  int? id;
  int? parentId;
  String? image;
  String? imageHome;
  String? name;
  String? describe;


}
