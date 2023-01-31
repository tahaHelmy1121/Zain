class RemoveCartModel {
  RemoveCartModel({
    this.status,
    this.reason,});

  RemoveCartModel.fromJson(Map<String,dynamic> json) {
    status = json['status'];
    reason = json['reason'];
  }
  int? status;
  String? reason;


}