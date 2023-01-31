class PromoTotal {
  int? totalOld;
  int? discount;
  String? image;
  var code;
  int? totalCart;
  var promoname;

  PromoTotal({this.totalOld,
    this.image,
    this.discount,
    this.code,
    this.totalCart,
    this.promoname});

  PromoTotal.fromJson(Map<String, dynamic> json) {
    totalOld = json['total_old'];
    image=json["image"];
    discount = json['discount'];
    code = json['code'];
    totalCart = json['total_cart'];
    promoname = json['promoname'];
  }
}
