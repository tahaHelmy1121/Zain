class AddAddressModel {
  int? status;
  String? reason;

  AddAddressModel({this.status, this.reason});
  AddAddressModel.fromJson(Map<String,dynamic> json) {
    status = json['status'];
    reason = json['reason'];
  }

}