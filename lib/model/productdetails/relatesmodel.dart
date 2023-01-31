class Relates {
  Relates({
    this.id,
    this.image,
    this.name,
    this.describe,
    this.categoryId,
    this.categoryName,
    this.favouriteId,
    this.price,
    this.discountPrice,});

  Relates.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    describe = json['describe'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    favouriteId = json['favourite_id'];
    price = json['price'];
    discountPrice = json['discount_price'];
  }
  int? id;
  String? image;
  String? name;
  String? describe;
  int?  categoryId;
  String? categoryName;
  dynamic? favouriteId;
  int? price;
  dynamic discountPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['name'] = name;
    map['describe'] = describe;
    map['category_id'] = categoryId;
    map['category_name'] = categoryName;
    map['favourite_id'] = favouriteId;
    map['price'] = price;
    map['discount_price'] = discountPrice;
    return map;
  }

}