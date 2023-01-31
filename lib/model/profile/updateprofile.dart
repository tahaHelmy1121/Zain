class UpdateProfile{

  var status;
  String? reason;

  UpdateProfile({this.status, this.reason});

  UpdateProfile.fromJson(Map<String,dynamic>jsonObject){
    status=jsonObject['status'];
    reason=jsonObject['reason'];
  }

}