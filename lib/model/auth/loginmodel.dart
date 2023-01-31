
class LoginModel {
  var status, reason, userId;

  LoginModel({this.status, this.reason, this.userId});

  LoginModel.fromJson(Map<String, dynamic> jsonObject) {
    status = jsonObject['status'];
    reason = jsonObject['reason'];
    userId = jsonObject['user_id'];
  }
}
