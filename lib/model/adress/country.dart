class CountryModel {
  var id;
  var isoCode;
  var addressFormat;
  var status;
  var postReq;

  CountryModel(
      {this.id, this.isoCode, this.addressFormat, this.status, this.postReq});

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isoCode = json['iso_code'];
    addressFormat = json['address_format'];
    status = json['status'];
    postReq = json['post_req'];
  }


}
