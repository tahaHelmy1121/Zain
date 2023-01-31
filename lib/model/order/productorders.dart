class ProductsOrders {
  int? id;
  int? orderId;
  int? productId;
  String? productName;
  String? productImage;
  String? colorName;
  String? sizeName;
  int? price;
  int? discountPrice;
  int? quantity;
  int? shippingCost;
  int? total;

  ProductsOrders(
      {this.id,
      this.orderId,
      this.productId,
      this.productName,
      this.productImage,
      this.price,
      this.discountPrice,
      this.quantity,
      this.shippingCost,
      this.total,
    });

  ProductsOrders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productImage = json['product_image'];
    price = json['price'];
    discountPrice = json['discount_price'];
    quantity = json['quantity'];
    shippingCost = json['shipping_cost'];
    total = json['total'];
    colorName =json['color_name'];
    sizeName =json['size_name'];
  }
}
