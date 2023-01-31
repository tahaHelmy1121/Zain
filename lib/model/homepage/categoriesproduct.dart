class CategoriesProduct {
  var id;
  var image;
  var name;
  var describe;
  var categoryId;
  var categoryName;
  var favouriteId;
  var price;
  var discountPrice;
  CategoriesProduct({
    this.id,
    this.image,
    this.name,
    this.describe,
    this.categoryId,
    this.categoryName,
    this.favouriteId,
    this.price,
    this.discountPrice,});

  CategoriesProduct.fromJson(dynamic json) {
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

}