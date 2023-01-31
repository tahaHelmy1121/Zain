class EditModel {
  int? status;
  String? reason;

  EditModel({this.status, this.reason});
  EditModel.fromJson(Map<String,dynamic> json) {
    status = json['status'];
    reason = json['reason'];
  }

}