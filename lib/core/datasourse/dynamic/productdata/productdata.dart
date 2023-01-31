import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/productmodel/productmodel.dart';
import '../../constant/urlconnection.dart';

class GetProductdata {
  Future<List<ProductsModels>> getDate([var startItems]) async {
    List <ProductsModels> pros = [];
    Map<String,dynamic>body={
      "start_item":startItems,
    };
    var response = await http.post(
      Uri.https(passeUrl, pro),body:jsonEncode(body) ,
    );
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      for (var item in body) {
        pros.add(
          ProductsModels.fromJson(item),
        );
      }

    }

    return pros;
  }


}
