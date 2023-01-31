import 'package:shop/model/auth/loginmodel.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../constant/urlconnection.dart';

class LoginData {
  static Future<List<LoginModel>> loginCustomer(
      String userName, password, device) async {
    List<LoginModel> data = [];
    Map<String, dynamic> body = {
      "user_name": userName,
      "password": password,
      "device_id": device,
    };
    http.Response response = await http.post(
      Uri.https(passeUrl,login),
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      data.add(LoginModel.fromJson(jsonData));
    }
    return data;
  }
}
