import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../model/favourite/favourite.dart';
import '../../../constant/urlconnection.dart';

class FavoriteAdd {
  static Future<FavoriteModel> addFavorite({required int customerId,}) async {
    FavoriteModel favoriteModel = FavoriteModel();
    Map<String, dynamic> body = {
      'customer_id': customerId,
    //  'product_id': productId,
    };
    var response = await http.post(Uri.https(passeUrl, favoriteAdd),
        body: jsonEncode(body));
    if(response.statusCode==200){
      var jsonData=jsonDecode(response.body);
      favoriteModel=FavoriteModel.fromJson(jsonData);
    }
    return favoriteModel;
  }
}
