import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../model/order/ordermodel.dart';
import '../../../constant/urlconnection.dart';

class OrderData {
  static Future<OrderModel> orderDone(int idCustomer, idAddress,
      [var codeNum]) async {
    Map<String, dynamic> body = {
      "customer_id": idCustomer,
      "address_id": idAddress,
      "code": codeNum,
    };
    OrderModel orderModel = OrderModel();
    var response = await http.post(Uri.https(passeUrl, customerNewOrderCart),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      orderModel = OrderModel.fromJson(jsonData);
    }
    return orderModel;
  }
}
