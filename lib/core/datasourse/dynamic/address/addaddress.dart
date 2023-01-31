import 'dart:convert';

import 'package:shop/model/adress/addaddresmodel.dart';
import 'package:http/http.dart'as http;

import '../../../constant/urlconnection.dart';
class AddNewAddress {
    static Future<AddAddressModel> addAddress({var customerId,
        var firstName,
        var address1,
        var countryId,
        var regionId,
        var isDefault}) async {
        AddAddressModel addAddressModel = AddAddressModel();
        Map<String, dynamic>map = {
            "customer_id": customerId,
            "address_first_name": firstName,
            "address_address_1": address1,
            "country_id": countryId,
            "region_id": regionId,
            "is_default": isDefault,


        };
        var response = await http.post(Uri.https(passeUrl, addAddressApi),
            body: jsonEncode(map),);
        if (response.statusCode == 200) {
            var jsonData = jsonDecode(response.body);
            addAddressModel = AddAddressModel.fromJson(jsonData);
        }
        return addAddressModel;
    }
}