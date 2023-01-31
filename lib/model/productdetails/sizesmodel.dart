class Sizes {
  Sizes(
      {this.id,
      this.productId,
      this.size,
      this.productColorsId,
      this.productColorId,
      this.quantity,
      });

  Sizes.fromJson(dynamic json) {
    id = json['size_id'];
    productId = json['product_id'];
    size = json['size'];
    productColorsId = json['product_colors_id'];
    productColorId = json['product_color_id'];
    quantity = json['quantity'];
  }

  int? id;
  int? productId;
  String? size;
  int? productColorsId;
  int? productColorId;
  int? quantity;
  bool? isSelect=false;
}
