import 'dart:convert';
import 'package:http/http.dart'as http;

import '../../../../model/cart/removecart.dart';
import '../../../constant/urlconnection.dart';

class RemoveData {


  static Future<RemoveCartModel> removeControllerCart(int id)async{

    RemoveCartModel removeCartModel =RemoveCartModel();
    Map<String,int>body={
      "id":id,
    };
    var response= await http.post(Uri.https(passeUrl,removeCartApi),body:jsonEncode(body),);
    if(response.statusCode==200){
      var jsonData=jsonDecode(response.body);
      removeCartModel=   RemoveCartModel.fromJson(jsonData);
    }
    return removeCartModel;
  }

}