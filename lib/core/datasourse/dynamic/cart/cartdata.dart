import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop/model/cart/cartmodel.dart';

import '../../../constant/urlconnection.dart';

class Cartdata {
  static Future<CartModel> addToCart(
      {var customerId,
        productId,
        sizeId,
        colorId,
        quantity,
        price,
        quantityEqual}) async {
    CartModel cartModel = CartModel();
    Map<String, dynamic> body = {
      "customer_id": customerId,
      "product_id": productId,
      "size_id": sizeId,
      "color_id": colorId,
      "quantity": quantity,
      "price": price,
      "quantity_equal": quantityEqual,
    };
    var response = await http.post(
      Uri.https(passeUrl, addCart),
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      cartModel = CartModel.fromJson(jsonData);
    }
    return cartModel;
  }
}
