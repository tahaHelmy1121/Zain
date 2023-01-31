
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/core/constant/style.dart';
import 'package:shop/core/datasourse/dynamic/favourite/addtofavourite.dart';
import 'package:shop/core/datasourse/productdata/productdata.dart';
import 'package:shop/model/favourite/favourite.dart';
import 'package:shop/view/screen/productdetails/productdetails.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../model/productmodel/productmodel.dart';
import '../../customdrawer.dart';
import '../../widget/custom/customappbar.dart';
import '../auth/login.dart';
import '../favourite/favourite.dart';

class Products extends StatefulWidget {
  int? subId;

  Products([this.subId]);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  ScrollController scrollController = ScrollController();
  GetProductdata getProductController = GetProductdata();
  List<ProductsModels> productShow = [];
  int startItem = 0;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getProItem();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        setState(() {
          getProItem();
          getCustomerId();
        });
      }
    });
  }

  int xdCustomer = 0;


  getCustomerId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      xdCustomer = sharedPreferences.getInt('customerId')!;
    });
  }

  getProItem() {
    getProductController.getDate(startItem).then((value) {
      productShow.addAll(value);
      setState(() {
        loading = false;
        startItem += 21;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isfav = false;
    return Scaffold(
        endDrawer: Custom(),
        // bottomNavigationBar: CustomConvex(),
        appBar: AppBar(
          flexibleSpace: MyAppBar(),
          elevation: 0,
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "المنتجات",
            style: Style.style1,
          ),
          toolbarHeight: 55,
        ),
        body: FutureBuilder(
            future: FavoriteAdd.addFavorite(customerId: xdCustomer),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.active:
                case ConnectionState.none:
                  return CircularProgressIndicator(
                    color: AppColor.secondColor,
                  );
                default:
                  if (snapshot.hasError) {
                    return const Text("");
                  } else {
                    FavoriteModel fav = FavoriteModel();
                    if (fav == null) {
                      return const Text("البيانات ليست متاحة الان");
                    } else {
                      return drewBodyProducts();
                    }
                  }
              }
            }));
  }

  Widget drewBodyProducts() {
    return Container(
      child: loading
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: AppColor.fourthColor,
                color: AppColor.fourthColor,
              ),
            )
          : GridView.builder(
              controller: scrollController,
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              itemCount: productShow.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 350,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, position) {
                bool isfav = false;
                return Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ProductDetails(
                            productId: productShow[position].id,
                            name: productShow[position].name,
                          );
                        }));
                      },
                      child: Card(
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 230,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      productShow[position].image ??
                                          Image.asset(
                                            "assets/image/emp.png",
                                            fit: BoxFit.fill,
                                          ),
                                    ),
                                    fit: BoxFit.fill),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                ),
                              ),
                            ), // (discountData[position].discount != null)
                            Column(
                              children: [
                                Text(
                                  '${productShow[position].price}',
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontFamily: "Nunito",
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1,
                                      fontSize: 12),
                                ),
                                Text(
                                  productShow[position].name,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 8.0,
                                    fontFamily: "Nunito",
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
    );
  }
}
