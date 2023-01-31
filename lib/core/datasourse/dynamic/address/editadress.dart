import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../model/adress/editaddress.dart';
import '../../../constant/urlconnection.dart';

class EditAddress {

     static Future <EditAddressUser> showAddress(int id) async {
          EditAddressUser editAddressUser =EditAddressUser();
          Map<String, dynamic> body = {
               "id":id,
          };
          var response = await http.post(
               Uri.https(passeUrl,showAddressApi),
               body: jsonEncode(body),
          );
          if(response.statusCode==200){
               var jsonData=jsonDecode(response.body);

               editAddressUser=EditAddressUser.fromJson(jsonData);
          }
          return editAddressUser;
     }



}
