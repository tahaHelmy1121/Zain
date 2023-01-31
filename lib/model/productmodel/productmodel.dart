class ProductsModels {
  var id, categoryId, price, favouriteId;
  var image, describe, name,categoryname;


  ProductsModels.fromJson (Map<dynamic,dynamic>jsonObject){

    this.id = jsonObject["id"];
    this.categoryId = jsonObject["category_id"];
    this.price = jsonObject["price"];
    this.favouriteId = jsonObject["is_favourite"];
    this.image = jsonObject["image"];
    this.describe = jsonObject["describe"];
    this.name = jsonObject["name"];
    this.categoryname = jsonObject["category_name"];

  }


}

