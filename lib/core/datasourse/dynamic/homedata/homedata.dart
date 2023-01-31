import 'dart:convert';

import 'package:http/http.dart' as http;


import '../../../../model/homepage/homemodel.dart';
import '../../../constant/urlconnection.dart';

class HomeData {
  static Future<HomePageModel> getHome({required int customerId, required int parentId}) async {
    HomePageModel homePageModel = HomePageModel();
    Map<String, dynamic> body = {
      "parent_id": parentId,
      "customer_id": customerId,
    };
    var response = await http.post(Uri.https(passeUrl, categoriesAll),
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      homePageModel = HomePageModel.fromJson(jsonData);
    }

    return homePageModel;
  }
}
