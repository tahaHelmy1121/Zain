

import 'package:shop/model/order/productorders.dart';

class OrderDetailsModel {
  int? id;
  int?customerId;
  String? addressId;
  int? orderTotal;
  int? shippingCost;
  int? fullTotal;
  int? payType;
  String? createDateTime;
  var promoCode ;
  int? promoVal;
  var orderStatus;
  int? taxValue;
  List<ProductsOrders>? products;

  OrderDetailsModel(
      {this.id,
        this.customerId,
        this.addressId,
        this.orderTotal,
        this.shippingCost,
        this.fullTotal,
        this.payType,
        this.createDateTime,
        this.orderStatus,
        this.promoCode,
        this.promoVal,
        this.taxValue,
        this.products});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    addressId = json['address_id'];
    orderTotal = json['order_total'];
    shippingCost = json['shipping_cost'];
    fullTotal = json['full_total'];
    payType = json['pay_type'];
    createDateTime = json['create_date_time'];
    orderStatus = json['order_status'];
    promoCode=json['promocode'];
    promoVal=json['promoval'];
    taxValue = json['tax_value'];

    if (json['products'] != null) {
      products = <ProductsOrders>[];
      json['products'].forEach((v) {
        products?.add( ProductsOrders.fromJson(v));
      });
    }
  }


}


