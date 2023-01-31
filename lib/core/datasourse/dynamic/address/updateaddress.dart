import 'dart:convert';

import 'package:http/http.dart'as http;

import '../../../../model/adress/editmodel.dart';
import '../../../constant/urlconnection.dart';


class UpdateAddress{


  static Future<EditModel> editAddress(
      {var customerId,
        var firstName,
        var address1,
        var countryId,
        var regionId,
        var id,
        var isDefault}) async {
    EditModel addAddressModel = EditModel();
    Map<String, dynamic> body = {
      "customer_id": customerId,
      "address_first_name": firstName,
      "address_address_1": address1,
      "country_id": countryId,
      "region_id": regionId,
      "id":id,
      "is_default": isDefault,
    };
    var response = await http.post(Uri.https(passeUrl,updateAddress),
      body: jsonEncode(body),);
    if(response.statusCode==200){
      var jsonData=jsonDecode(response.body);
      addAddressModel=EditModel.fromJson(jsonData);
    }
    return addAddressModel ;
  }

}