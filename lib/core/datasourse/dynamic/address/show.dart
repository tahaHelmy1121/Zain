import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../model/adress/showaddress.dart';
import '../../../constant/urlconnection.dart';

class ShowAddressData {
 static Future<List<ShowAddressModel>> showAddress(int customer) async {
    List<ShowAddressModel> data = [];
    Map<String, dynamic> body = {
      "customer_id": customer,
    };
    var response = await http.post(
      Uri.https(passeUrl,showAddressApi),
      body: jsonEncode(body),
    );
    if(response.statusCode==200){
      var jsonData=jsonDecode(response.body);
      for(var item in jsonData ){
        data.add(ShowAddressModel(
          customerId: item["customer_id"],
          id: item["id"],
          addressAddress1: item["address_address_1"],
          addressFirstName: item["address_first_name"],
          countryId: item["country_id"],
          countryName: item["country_name"],
          mobile: item["mobile"],
          regionId: item["region_id"],
          regionName: item["region_name"],
        ));
      }

    }
    return data;
  }
}
