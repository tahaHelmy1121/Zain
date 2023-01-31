import 'dart:convert';

import 'package:http/http.dart'as http;

import '../../../../model/cart/skipmodel.dart';
import '../../../constant/urlconnection.dart';

class SkipData {


  static Future <SkipMode> skipCode(int customerZD )async{
    SkipMode sCode =SkipMode();
    Map<String,dynamic>body={
      "customer_id":customerZD,
    };
    var response = await  http.post(Uri.https(passeUrl,promo),body: jsonEncode(body));
    if(response.statusCode==200){
      var jsonData =jsonDecode(response.body);
      sCode=SkipMode.fromJson(jsonData);
    }
    return sCode;
  }
}