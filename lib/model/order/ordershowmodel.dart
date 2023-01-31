class OrderShowModel {
  int? id;
  int? customerId;
  String? address;
  int? orderTotal;
  int? shippingCost;
  int? fullTotal;
  String? createDateTime;
  String? orderStatus;
  int? taxValue;

  OrderShowModel(
      {this.id,
        this.customerId,
        this.address,
        this.orderTotal,
        this.shippingCost,
        this.fullTotal,
        this.createDateTime,
        this.orderStatus,
        this.taxValue});

  OrderShowModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    address = json['address'];
    orderTotal = json['order_total'];
    shippingCost = json['shipping_cost'];
    fullTotal = json['full_total'];
    createDateTime = json['create_date_time'];
    orderStatus = json['order_status'];
    taxValue = json['tax_value'];
  }

}
