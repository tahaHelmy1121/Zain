import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../model/adress/removeaddress.dart';
import '../../../constant/urlconnection.dart';

class RemoveAddress {
  static Future<RemoveModel> removeAddressById(int id) async {
    RemoveModel removeModel=RemoveModel();
    Map<String,dynamic> body = {
      "id": id,
    };
    var response = await http.post(Uri.https(passeUrl,removeAddress),
        body: jsonEncode(body));
    if(response.statusCode==200){
      var jsonData =jsonDecode(response.body);
      removeModel=RemoveModel.fromJson(jsonData);
    }
    return removeModel;
  }
}
