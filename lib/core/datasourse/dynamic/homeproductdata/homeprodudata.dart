import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../model/homepage/categoriesproduct.dart';
import '../../../constant/urlconnection.dart';


class HomeProductData {
  static Future<List<CategoriesProduct>> getHomeProduct(
      {required int supId, required int parentId}) async {
    List<CategoriesProduct> data = [];
    Map<dynamic, dynamic> body = {
      "sup_id": supId,
      "parent_id": parentId,
    };

    var response = await http.post(
      Uri.https(passeUrl, productHome),
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      for (var item in jsonData) {
        data.add(CategoriesProduct(

          name: item['name'],
          image: item['image'],
          id: item['id'],
          describe: item['describe'],
          categoryId: item['category_id'],
          categoryName: item['category_name'],
          favouriteId: item['favourite_id'],
          price: item['price'],
          discountPrice: item['discount_price'],
        ));
      }
    }

    return data;
  }
}
