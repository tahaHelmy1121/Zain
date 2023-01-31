import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../model/auth/register.dart';
import 'package:http/http.dart' as http;

import '../../../constant/urlconnection.dart';

class RegestierData {
  static Future<List<RegisterModel>> registerCustomer(
      {var firstName,
      lastName,
      emailAddress,
      phone,
      userName,
      password,
      device}) async {
    List<RegisterModel> data = [];

    Map<String, dynamic> map = {
      "first_name": firstName,
      "last_name": lastName,
      "email": emailAddress,
      "mobile": phone,
      "username": userName,
      "password": password,
      "device_id": device,
    };
    http.Response response =
        await http.post(Uri.https(passeUrl, register), body: jsonEncode(map),
        headers:  {HttpHeaders.authorizationHeader: "Basic token"});
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("Result: ${response.body}");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //now set the token inside the shared_preferences
      //I assumed that the token is a field in the json response, but check it before!!
      await prefs.setString('token',jsonData['token'].toString());
      data.add(RegisterModel.fromJson(jsonData));
    }
    return data;
  }
}
