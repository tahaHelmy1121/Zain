class GetColorsImage {
  var id;
  var image;
  var productId;
  var productColorsId;
  var productColorId;

  GetColorsImage({
    this.id,
    this.image,
    this.productId,
    this.productColorsId,
    this.productColorId,});

  GetColorsImage.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    productId = json['product_id'];
    productColorsId = json['product_colors_id'];
    productColorId = json['product_color_id'];
  }
}