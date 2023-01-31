import 'package:flutter/material.dart';
import 'package:shop/core/constant/color.dart';
import 'package:shop/core/datasourse/dynamic/homeproductdata/homeprodudata.dart';


import '../../../../model/homepage/categoriesproduct.dart';
import '../../../../model/homepage/categoriessup.dart';
import '../../productdetails/productdetails.dart';

class NameSubCategoryHomePage extends StatefulWidget {
  final List<CategoriesSup> data;
  final int categoryParent;

  NameSubCategoryHomePage({required this.data, required this.categoryParent});

  @override
  _NameSubCategoryHomePageState createState() =>
      _NameSubCategoryHomePageState();
}

class _NameSubCategoryHomePageState extends State<NameSubCategoryHomePage> {
  int onTaped = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 6),
          width: double.infinity,
          height: 30,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.data.length,
              itemBuilder: (context, position) {
                return Container(
                  width: 105,
                  child: GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.only(left: 4, right: 4),
                        width: double.infinity,
                        height: 5,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              tileMode: TileMode.mirror,
                              colors: [
                              AppColor.fourthColor,
                                AppColor.primaryColor
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(25),
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25),
                            )),
                        child: Text(
                          widget.data[position].name!,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                            wordSpacing: 1,
                            fontSize: 8,
                            fontFamily: "BigVesta",
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          onTaped = widget.data[position].id!;
                        });
                      }),
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            height: 600,
            width: double.infinity,
            child: FutureBuilder(
                future: HomeProductData.getHomeProduct(
                    parentId: widget.categoryParent, supId: onTaped),
                builder: (context, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                    case ConnectionState.none:
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.teal,
                        ),
                      );
                    default:
                      if (snapshot.hasError) {
                        return const Text("");
                      } else {
                        List<CategoriesProduct> info = snapshot.data;
                        return GridView.builder(
                            itemCount: info.length,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 7,
                                crossAxisSpacing: 5,
                                mainAxisExtent: 380,
                                crossAxisCount: 2),
                            itemBuilder: (context, position) {
                              return Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                     Navigator.push(context,
                                         MaterialPageRoute(builder: (context) {
                                            return ProductDetails(
                                              productId: info[position].id,
                                              name: info[position].name,
                                            );

                                         }));
                                    },
                                    child: Card(
                                      elevation: 3,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight:
                                              Radius.circular(10))),
                                      child: Column(
                                        children: [
                                          (info[position].image.isEmpty ||
                                              info[position].image == null)
                                              ? Image.asset(
                                            "assets/image/ww.gif",
                                            fit: BoxFit.cover,
                                          )
                                              : Container(
                                            height: 250,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    (info[position]
                                                        .image),
                                                  ),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            info[position].name,
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                fontFamily: "Nunito",
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1,
                                                fontSize: 12),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          (info[position].discountPrice == null)
                                              ? Text(
                                            "EGP ${info[position].price.toString()}",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Nunito",
                                                fontWeight:
                                                FontWeight.w400,
                                                letterSpacing: 1,
                                                fontSize: 8),
                                          )
                                              : Column(
                                            children: [
                                              Text(
                                                "EGP ${info[position].discountPrice.toString()}",
                                                textAlign:
                                                TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Nunito",
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    letterSpacing: 1,
                                                    fontSize: 8),
                                              ),
                                              Text(
                                                "EGP ${info[position].price.toString()}",
                                                style: TextStyle(
                                                    decoration:
                                                    TextDecoration
                                                        .lineThrough,
                                                    color: Colors
                                                        .orangeAccent
                                                        .shade200,
                                                    fontFamily: "Nunito",
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    letterSpacing: 1,
                                                    fontSize: 8),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 45,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: ExactAssetImage(
                                              "assets/image/—Pngtree—vector new tag icon_3989600.png")),
                                    ),
                                  ),
                                ],
                              );
                            });
                      }
                  }
                }),
          ),
        )
      ],
    );
  }
}
