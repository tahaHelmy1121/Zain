class ImagesModel {
  var id;
  var image;
  var productId;
  var productColorsId;
  var productColorId;
  ImagesModel({
    this.id,
    this.image,
    this.productId,
    this.productColorsId,
    this.productColorId,});

  ImagesModel.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    productId = json['product_id'];
    productColorsId = json['product_colors_id'];
    productColorId = json['product_color_id'];
  }




}