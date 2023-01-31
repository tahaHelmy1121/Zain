

import 'categoriesparent.dart';
import 'categoriesproduct.dart';
import 'categoriesslider.dart';
import 'categoriessup.dart';

class HomePageModel {
  List<CategoriesParent >? categoriesParent ;
  List<CategoriesSlider>? categoriesSlider;
  List<CategoriesSup>? categoriesSup;
  List<CategoriesProduct>? categoriesProduct;
  HomePageModel({
      this.categoriesParent , 
      this.categoriesSlider, 
      this.categoriesSup, 
      this.categoriesProduct,});

  HomePageModel.fromJson(dynamic json) {
    if (json['categories_parent '] != null) {
      categoriesParent  = [];
      json['categories_parent '].forEach((v) {
        categoriesParent ?.add(CategoriesParent .fromJson(v));
      });
    }
    if (json['categories_slider'] != null) {
      categoriesSlider = [];
      json['categories_slider'].forEach((v) {
        categoriesSlider?.add(CategoriesSlider.fromJson(v));
      });
    }
    if (json['categories_sup'] != null) {
      categoriesSup = [];
      json['categories_sup'].forEach((v) {
        categoriesSup?.add(CategoriesSup.fromJson(v));
      });
    }
    if (json['categories_product'] != null) {
      categoriesProduct = [];
      json['categories_product'].forEach((v) {
        categoriesProduct?.add(CategoriesProduct.fromJson(v));
      });
    }
  }




}











