import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/core/constant/style.dart';
import 'package:shop/view/screen/productdetails/productdetailsimage.dart';
import 'package:shop/view/screen/productdetails/rating_widget.dart';

import '../../../core/constant/color.dart';
import '../../../core/datasourse/dynamic/productdetails/productdetals.dart';
import '../../../model/productdetails/productdetailsmodel.dart';
import '../../customdrawer.dart';
import '../../widget/custom/customappbar.dart';
import 'addtofavourite.dart';
import 'drewawamsizes.dart';
import 'drewcolordetails.dart';
import 'drewrelateproduct.dart';


class ProductDetails extends StatefulWidget {
  final dynamic productId;
  final String name;
  final dynamic colorId;

  ProductDetails({this.productId, required this.name, this.colorId});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      endDrawer: Custom(),
      backgroundColor:AppColor.backgroundcolor,
      appBar: AppBar(
        flexibleSpace: MyAppBar(),
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          widget.name,
          style: TextStyle(
            fontSize: 12
          ),
        ),
        toolbarHeight:40,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: FutureBuilder(
              future: ProductDetailsData.getProductDetails(
                  productId: widget.productId, colorId: widget.colorId),
              builder: (context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.active:
                  case ConnectionState.none:
                    return const Text("");
                  default:
                    if (snapshot.hasError) {
                      return const Text("");
                    } else {
                      ModelDetails data = snapshot.data;
                      if (data == null) {
                        return const Text("البيانات ليست متاحة الان");
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [

                            ProductDetailsImage(
                              data: data,
                            ),
                            RatingWidget(rating: 4.0,),
                            drewMainDetailProduct(data),
                             SizedBox(
                              height: 5,
                            ),
                            (data.sizes!.isEmpty)
                                ? const Text("is Empty now")
                                : DrewSizes(data: data),
                            Padding(
                              padding:
                              const EdgeInsets.only(right: 7, bottom: 7),
                              child: Transform.translate(
                                offset: const Offset(0, -2),
                                child: const Text(
                                  "المنتجات المرتبطة:",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontFamily: "BigVesta",
                                      letterSpacing: 2,
                                      color: Colors.blueGrey),
                                ),
                              ),
                            ),
                            (data.sizes!.isNotEmpty)?
                             CustomFavourite(data: data,):
                                Text("is Empty for Now"),
                            DrewRelateProducts(
                              data: data,
                            ),
                          ],
                        );
                      }
                    }
                }
              }),
        ),
      ),
    );
  }

  Widget drewMainDetailProduct(ModelDetails data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 150,
                alignment: Alignment.centerRight,
                child: Text(
                  data.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 14.0,
                    fontFamily: "BigVesta",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Text(
                'أسم المنتج : ',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 16.0,
                    fontFamily: "BigVesta",
                    color: AppColor.grey),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              (data.discountPrice == null)
                  ? Text(
                data.price.toString(),
                textDirection: TextDirection.ltr,
                style: const TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 14.0,
                  fontFamily: "BigVesta",
                  fontWeight: FontWeight.w500,
                ),
              )
                  : Row(
                children: [
                  Text(
                    "EGP${data.price.toString()}",
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 14.0,
                      color: Colors.grey,
                      fontFamily: "BigVesta",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "EGP${data.discountPrice.toString()}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontFamily: "BigVesta",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Text(
                'سعر المنتج : ',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 16.0,
                    fontFamily: "BigVesta",
                    color: Colors.orangeAccent),
              ),
            ],
          ),

          Container(
            alignment: Alignment.centerRight,
            child: Text(
              data.describe.replaceAll('<br>', '\n'),
              maxLines: 4,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: const TextStyle(
                letterSpacing: 2,
                height: 1.5,
                overflow: TextOverflow.ellipsis,
                fontSize: 14.0,
                fontFamily: "BigVesta",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height:12,
          ),
          const SizedBox(
            width: 0,
          ),
        ],
      ),
    );
  }
}
