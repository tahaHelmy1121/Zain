class OrderModel {
  int? status;
  var reason;

  OrderModel({this.status, this.reason});

  OrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    reason = json['reason'];
  }


}
