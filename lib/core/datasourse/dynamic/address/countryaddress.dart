import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../model/adress/country.dart';
import '../../../constant/urlconnection.dart';


class CountryData {
  static Future<List<CountryModel>> fetchCountry() async {
    List<CountryModel> data = [];
    var response = await http.post(Uri.https(passeUrl, country));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      for (var item in jsonData) {
        data.add(CountryModel(
          id: item["id"],
          status: item["status"],
          addressFormat: item["address_format"],
          isoCode: item["iso_code"],
          postReq: item["post_req"],
        ));
      }
    }
    return data;
  }
}
