import 'package:shop/model/cart/promocodetitle.dart';

class PromoCodeModel {
  PromoTotal? total;
  String? reason;
  int? status;

  PromoCodeModel({ this.total,  this.reason,  this.status});

  PromoCodeModel.fromJson(Map<String, dynamic> json) {
    total = (json['total'] != null ? new PromoTotal.fromJson(json['total']) : null)!;
    reason = json['reason'];
    status = json['status'];
  }


}


