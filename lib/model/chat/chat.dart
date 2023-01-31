class ShowChatModel {
  var id;
  var customerId;
  var createDateTime;
  var message;
  var productid;
  var products;
  var names;
  var describe;
  var discountPrice;
  var isRead;
  var msgType;
  var type;

  ShowChatModel(
      {this.id,
        this.customerId,
        this.createDateTime,
        this.message,
        this.productid,
        this.products,
        this.names,
        this.describe,
        this.discountPrice,
        this.isRead,
        this.msgType,
        this.type});

  ShowChatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    createDateTime = json['create_date_time'];
    message = json['message'];
    productid = json['productid'];
    products = json['products'];
    names = json['names'];
    describe = json['describe'];
    discountPrice = json['discount_price'];
    isRead = json['is_read'];
    msgType = json['msg_type'];
    type = json['type'];
  }


}
