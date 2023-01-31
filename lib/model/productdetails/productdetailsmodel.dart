

import 'package:shop/model/productdetails/relatesmodel.dart';
import 'package:shop/model/productdetails/sizesmodel.dart';

import 'colormodel.dart';
import 'imagesmodels.dart';

class ModelDetails {
  var id;
  var partno;
  var price;
  var quantity;
  var categoryId;
  var image;
  var name;
  var describe;
  var favouriteId;
  int? discountPrice;
  List<ColorsModel>? colors;
  List<ImagesModel>? images;
  List<Sizes>? sizes;
  List<Relates>? relates;
  ModelDetails({
    this.id,
    this.partno,
    this.price,
    this.quantity,
    this.categoryId,
    this.image,
    this.name,
    this.describe,
    this.favouriteId,
    this.discountPrice,
    this.colors,
    this.images,
    this.sizes,
    this.relates});

  ModelDetails.fromJson(dynamic json) {
    id = json['id'];
    partno = json['partno'];
    price = json['price'];
    quantity = json['quantity'];
    categoryId = json['category_id'];
    image = json['image'];
    name = json['name'];
    describe = json['describe'];
    favouriteId = json['favourite_id'];
    discountPrice = json['discount_price'];
    if (json['colors'] != null) {
      colors = [];
      json['colors'].forEach((v) {
        colors?.add(ColorsModel.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(ImagesModel.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      sizes = [];
      json['sizes'].forEach((v) {
        sizes?.add(Sizes.fromJson(v));
      });
    }
    if (json['relates'] != null) {
      relates = [];
      json['relates'].forEach((v) {
        relates?.add(Relates.fromJson(v));
      });
    }
  }




}


