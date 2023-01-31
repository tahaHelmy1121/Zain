import 'dart:convert';

import 'package:shop/model/profile/profile.dart';
import 'package:http/http.dart'as http;

import '../../../../model/profile/updateprofile.dart';
import '../../../constant/urlconnection.dart';
class ProfileData {
  static Future<List<ProfileModel>> profileCustomer({var customerId}) async {
    List<ProfileModel> data = [];
    Map<String, dynamic> body = {
      "customer_id": customerId,
    };
    var response = await http.post(
      Uri.https(passeUrl, Profile),
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      data.add(
        ProfileModel.fromJson(jsonData),
      );
    }
    return data;
  }
}
class ProfileDataUpdate {
  static Future<List<UpdateProfile>> profileUpdate(
      {var firstName, lastName, userName, email, phone,idCustomer}) async {
    List<UpdateProfile> data = [];
    Map<String, dynamic> body = {
      "first_name": firstName,
      "last_name":lastName,
      "username":userName,
      "email":email,
      "mobile":phone,
      "id":idCustomer,
    };
    http.Response response = await http.post(
      Uri.https(passeUrl,updateProfile),
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      data.add(
        UpdateProfile.fromJson(jsonData),
      );
    }
    return data;
  }
}
