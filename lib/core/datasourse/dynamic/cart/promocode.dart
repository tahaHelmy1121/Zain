import 'dart:convert';
import 'package:http/http.dart'as http;


import '../../../../model/cart/promocode.dart';
import '../../../constant/urlconnection.dart';

class PromoData{

static Future <PromoCodeModel> sendCode(int id , var pCode)async{
  PromoCodeModel promoCode =PromoCodeModel();
   Map<String,dynamic>body={
     "customer_id":id,
     "code":pCode,
   };
   var response = await  http.post(Uri.https(passeUrl,promo),body: jsonEncode(body));
   print(response.body);
   if(response.statusCode==200){
     var jsonData =jsonDecode(response.body);
     promoCode=PromoCodeModel.fromJson(jsonData);
   }
   return promoCode;
 }


}