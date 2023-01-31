class SkipMode {
  int?  total;
  String? reason;
  int? status;

  SkipMode({this.total, this.reason, this.status});

  SkipMode.fromJson(Map<String,dynamic> json) {
    total = json['total'];
    reason = json['reason'];
    status = json['status'];
  }

}
