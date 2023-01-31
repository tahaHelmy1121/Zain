import 'dart:convert';

import 'package:http/http.dart'as http;

import '../../../../model/cart/cartshow.dart';
import '../../../constant/urlconnection.dart';

class ShowCartData {

  static  Future<CartShow>  showCartController(int customerId)async{
    CartShow cartShow =CartShow();
    Map <String,int> body ={
      "customer_id":customerId,
    };
    var response =await http.post(Uri.https(passeUrl,showCartUrl),body:jsonEncode(body),);
    if(response.statusCode==200){
      var jsonData = jsonDecode(response.body);
      cartShow=CartShow.fromJson(jsonData);


    }
    return cartShow;
  }

}