class CartProductShow {
  var cartstatus;
  var customerId;
  var id;
  var productId;
  var sizeId;
  var sizeName;
  var colorId;
  var colorName;
  var productName;
  var categoryName;
  var productImage;
  List<int>? listQuantity;
  var price;
  var quantity;
  var total;
  CartProductShow({
    this.cartstatus,
    this.customerId,
    this.id,
    this.productId,
    this.sizeId,
    this.sizeName,
    this.colorId,
    this.colorName,
    this.productName,
    this.categoryName,
    this.productImage,
    this.listQuantity,
    this.price,
    this.quantity,
    this.total,
  });

  CartProductShow.fromJson(dynamic json) {
    cartstatus = json['cartstatus'];
    customerId = json['customer_id'];
    id = json['id'];
    productId = json['product_id'];
    sizeId = json['size_id'];
    sizeName = json['size_name'];
    colorId = json['color_id'];
    colorName = json['color_name'];
    productName = json['product_name'];
    categoryName = json['category_name'];
    productImage = json['product_image'];
    listQuantity =
    json['list_quantity'] != null ? json['list_quantity'].cast<int>() : [];
    price = json['price'];
    quantity = json['quantity'];
    total = json['total'];
  }




}