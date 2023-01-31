class CityModel {
  int? id;
  String? name;
  int? countryId;
  int? status;

  CityModel({this.id, this.name, this.countryId, this.status});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    status = json['status'];
  }


}