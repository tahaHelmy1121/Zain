import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../model/setting/settingmodel.dart';
import '../../../constant/urlconnection.dart';

class SettingData {
  static Future<SettingModel> getSettings({var customerId}) async {
    SettingModel  data = SettingModel();
    Map<String,dynamic> body = {"customer_id": customerId};
    var response =
        await http.post(Uri.https(passeUrl,settings), body: jsonEncode(body));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      data=SettingModel.fromJson(jsonData);

    }
    return data ;
  }
}
