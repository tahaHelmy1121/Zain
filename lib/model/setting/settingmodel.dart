class SettingModel {
  var address, orders, fav, cart, notification, message;

  SettingModel(
      {this.address,
      this.orders,
      this.fav,
      this.cart,
      this.notification,
      this.message});

  SettingModel.fromJson(Map<String, dynamic> jsonObject) {
    address = jsonObject['customer_addresses'];
    orders = jsonObject['customer_orders'];
    fav = jsonObject['customer_favourites'];
    cart = jsonObject['customer_cart'];
    notification = jsonObject['customer_notifications'];
    message = jsonObject["customer_messages"];
  }
}
