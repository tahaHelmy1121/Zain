class RemoveModel {
  int? status;
  String? reason;

  RemoveModel({this.status, this.reason});

  RemoveModel.fromJson(Map<String,dynamic> json) {
    status = json['status'];
    reason = json['reason'];
  }


}
