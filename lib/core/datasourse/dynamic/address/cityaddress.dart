import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../model/adress/city.dart';
import '../../../constant/urlconnection.dart';


class CityData {
  static Future<List<CityModel>> fetchCity(int countryId) async {
    List<CityModel> data = [];
    Map <String,dynamic>body={
      "country_id":countryId,
    };
    var response = await http.post(Uri.https(passeUrl,region),body: jsonEncode(body));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      for (var item in jsonData) {
        data.add(CityModel(
          id: item["id"],
          status: item["status"],
          countryId: item["country_id"],
          name: item["name"],
        ));
      }
    }
    return data;
  }
}
