
import 'cartproductshow.dart';

class CartShow {
  List<CartProductShow>? products;
  int? totalCart;
  int? cartStatus;
  CartShow({
      this.products,
      this.totalCart, 
      this.cartStatus,});

  CartShow.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(CartProductShow.fromJson(v));
      });
    }
    totalCart = json['total_cart'];
    cartStatus = json['cart_status'];
  }




}



