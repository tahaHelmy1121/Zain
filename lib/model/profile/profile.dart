class ProfileModel {
  var firstName;
  var lasName;
  var userEmail;
  var userName;
  var phone;

  ProfileModel(
      {this.firstName,
        this.lasName,
        this.userEmail,
        this.userName,
        this.phone});

  ProfileModel.fromJson(Map<String, dynamic> jsonObject) {
    firstName = jsonObject['first_name'];
    lasName = jsonObject['last_name'];
    userEmail = jsonObject['user_email'];
    userName = jsonObject['user_name'];
    phone = jsonObject['mobile'];
  }
}
