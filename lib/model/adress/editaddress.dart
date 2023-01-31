
class EditAddressUser {
  int? id;
  String? addressFirstName;
  String? addressAddress1;
  int? countryId;
  int? regionId;
  String? countryName;
  String? regionName;
  int? customerId;
  String? mobile;

  EditAddressUser(
      {this.id,
        this.addressFirstName,
        this.addressAddress1,
        this.countryId,
        this.regionId,
        this.countryName,
        this.regionName,
        this.customerId,
        this.mobile});

  EditAddressUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressFirstName = json['address_first_name'];
    addressAddress1 = json['address_address_1'];
    countryId = json['country_id'];
    regionId = json['region_id'];
    countryName = json['country_name'];
    regionName = json['region_name'];
    customerId = json['customer_id'];
    mobile = json['mobile'];
  }


}
