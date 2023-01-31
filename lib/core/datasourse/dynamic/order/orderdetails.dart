import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../model/order/orderdetails.dart';
import '../../../constant/urlconnection.dart';

class OrdersDetailsData {
  static Future<OrderDetailsModel> getOrdersDetails(int id) async {
    OrderDetailsModel orderDetails =OrderDetailsModel();
    Map<String, dynamic> body = {
      "id":id,
    };

    var response = await http.post(
      Uri.https(passeUrl,customerOrder),
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      orderDetails=OrderDetailsModel.fromJson(jsonData);
    }

    return orderDetails;
  }
}
