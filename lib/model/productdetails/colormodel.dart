class ColorsModel {
  var id;
  var colorId;
  var productColorName;
  var colorsQuantity;
  ColorsModel({
    this.id,
    this.colorId,
    this.productColorName,
    this.colorsQuantity,});

  ColorsModel.fromJson(dynamic json) {
    id = json['id'];
    colorId = json['color_id'];
    productColorName = json['product_color_name'];
    colorsQuantity = json['colorsquantity'];
  }




}