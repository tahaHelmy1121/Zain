class CartModel {
  var status;
  var reason;
  var minQuantity;
  var availableQuantity;
  var totalCart;

  CartModel(
      {this.status,
        this.reason,
        this.minQuantity,
        this.availableQuantity,
        this.totalCart});

  CartModel.fromJson(Map<String,dynamic> json) {
    status = json['status'];
    reason = json['reason'];
    minQuantity = json['min_quantity'];
    availableQuantity = json['available_quantity'];
    totalCart = json['total_cart'];
  }


}
