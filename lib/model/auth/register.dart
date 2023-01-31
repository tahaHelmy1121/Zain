class RegisterModel {
  int? status;
  String? reason;
  int? customerId;
  String? userName;

  RegisterModel({this.status, this.reason, this.customerId, this.userName});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    reason = json['reason'];
    customerId = json['user_id'];
    userName = json['user_name'];
  }
}
