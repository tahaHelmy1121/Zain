
class FavoriteModel {
  var status;
  var reason;

  FavoriteModel({this.status, this.reason});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    reason = json['reason'];
  }


}
