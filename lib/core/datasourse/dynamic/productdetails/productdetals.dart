import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../model/productdetails/productdetailsmodel.dart';
import '../../../constant/urlconnection.dart';


class ProductDetailsData {
  static Future<ModelDetails> getProductDetails(
      {var productId, var colorId}) async {
    ModelDetails data = ModelDetails();
    Map<String, dynamic> body = {"id": productId, "color_id": colorId};
    var response =
    await http.post(Uri.https(passeUrl, pro), body: jsonEncode(body));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      data = ModelDetails.fromJson(jsonData);
    }

    return data;
  }
}
