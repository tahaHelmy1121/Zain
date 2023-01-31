import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../model/order/ordershowmodel.dart';
import '../../../constant/urlconnection.dart';

class OrdersShowData {
  static Future<List<OrderShowModel>> getOrdersShow(int customerId) async {
    List<OrderShowModel> data = [];
    Map<String, dynamic> body = {
      "customer_id": customerId,
    };

    var response = await http.post(
      Uri.https(passeUrl,customerOrder),
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      for (var item in jsonData) {
        data.add(OrderShowModel(
          id: item['id'],
          customerId: item['customer_id'],
          address: item['address'],
          orderTotal: item['order_total'],
          shippingCost: item['shipping_cost'],
          fullTotal: item['full_total'],
          createDateTime: item['create_date_time'],
          orderStatus: item['order_status'],
          taxValue: item['tax_value'],
        ));
      }
    }

    return data;
  }
}
