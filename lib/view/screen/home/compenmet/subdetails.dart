import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/datasourse/dynamic/productdetails/productdetals.dart';

import '../../../../core/constant/style.dart';
import '../../../../core/datasourse/dynamic/homeproductdata/homeprodudata.dart';
import '../../../../model/homepage/categoriesproduct.dart';
import '../../../customdrawer.dart';
import '../../../widget/custom/customappbar.dart';
import '../../productdetails/productdetails.dart';

class SubDetails extends StatefulWidget {
  final int id;
  final int pa;
  final dynamic name;

  SubDetails({required this.id, required this.pa, this.name});

  @override
  _SubDetailsState createState() => _SubDetailsState();
}

class _SubDetailsState extends State<SubDetails> {
  bool change = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: Custom(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: MyAppBar(),
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
         "SubDetails",
          style: Style.style1,
        ),
        toolbarHeight: 55,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      change = false;
                    });
                  },
                  icon: const Icon(EvaIcons.listOutline),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      change = true;
                    });
                  },
                  icon: const Icon(EvaIcons.gridOutline),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          (change == false || change == null)
              ? Expanded(
            child: FutureBuilder(
                future: HomeProductData.getHomeProduct(
                    parentId: widget.pa, supId: widget.id),
                builder: (context, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                    case ConnectionState.none:
                      return Container(
                          width: 40,
                          margin: const EdgeInsets.only(top: 160),
                          alignment: Alignment.center,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          ));
                    default:
                      if (snapshot.hasError) {
                        return const Text("");
                      } else {
                        List<CategoriesProduct> data = snapshot.data;
                        return SizedBox(
                          height: 400,
                          child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, position) {
                                return Stack(
                                  children: [
                                    SizedBox(
                                      height: 250,
                                      child: InkWell(
                                        onTap: () {
                                          Get.offAll(ProductDetails(
                                            name: data[position].name, productId
                                            :data[position].id,));
                                        },
                                        child: Card(
                                          elevation: 5,
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.all(3.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 300,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    const BorderRadius
                                                        .only(
                                                      topRight:
                                                      Radius.circular(
                                                          15),
                                                      bottomRight:
                                                      Radius.circular(
                                                          15),
                                                    ),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          data[position]
                                                              .image),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 7,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceAround,
                                                  children: [
                                                    SizedBox(
                                                      width: 100,
                                                      height: 120,
                                                      child: Text(
                                                        data[position]
                                                            .name
                                                            .toString(),
                                                        textAlign: TextAlign
                                                            .center,
                                                        overflow:
                                                        TextOverflow
                                                            .ellipsis,
                                                        maxLines: 3,
                                                        style: const TextStyle(
                                                            fontFamily:
                                                            "Nunito",
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            letterSpacing:
                                                            1,
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                    (data[position]
                                                        .discountPrice ==
                                                        null)
                                                        ? Text(
                                                      "EGP ${data[position]
                                                          .price.toString()}",
                                                      textAlign:
                                                      TextAlign
                                                          .center,
                                                      style: const TextStyle(
                                                          color: Colors
                                                              .black,
                                                          fontFamily:
                                                          "Nunito",
                                                          fontWeight:
                                                          FontWeight
                                                              .w400,
                                                          letterSpacing:
                                                          1,
                                                          fontSize:
                                                          14),
                                                    )
                                                        : Column(
                                                      children: [
                                                        Text(
                                                          "EGP ${data[position]
                                                              .discountPrice
                                                              .toString()}",
                                                          textAlign:
                                                          TextAlign
                                                              .center,
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontFamily:
                                                              "Nunito",
                                                              fontWeight:
                                                              FontWeight
                                                                  .w400,
                                                              letterSpacing:
                                                              1,
                                                              fontSize:
                                                              16),
                                                        ),
                                                        Text(
                                                          "EGP ${data[position]
                                                              .price
                                                              .toString()}",
                                                          style: TextStyle(
                                                              decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                              color: Colors
                                                                  .black
                                                                  ,
                                                              fontFamily:
                                                              "Nunito",
                                                              fontWeight:
                                                              FontWeight
                                                                  .w400,
                                                              letterSpacing:
                                                              1,
                                                              fontSize:
                                                              13),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        IconButton(
                                                          onPressed: () {
                                                            setState(() {});
                                                          },
                                                          icon: const Icon(
                                                            EvaIcons
                                                                .shoppingCartOutline,
                                                          ),
                                                        ),
                                                        IconButton(
                                                          onPressed: () {},
                                                          icon: const Icon(
                                                            EvaIcons
                                                                .heartOutline,
                                                            color: Colors
                                                                .black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            right: 5, top: 4, left: 5),
                                        width: 20,
                                        height: 80,
                                        decoration:  BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.black
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        );
                      }
                  }
                }),
          )
              : Expanded(
            child: SizedBox(
              height: 600,
              child: SizedBox(
                height: 542,
                child: FutureBuilder(
                    future: HomeProductData.getHomeProduct(
                        parentId: widget.pa, supId: widget.id),
                    builder: (context, AsyncSnapshot snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                        case ConnectionState.active:
                        case ConnectionState.none:
                          return Container(
                            width: 40,
                            margin: const EdgeInsets.only(top: 120),
                            alignment: Alignment.center,
                            child: const Text(""),
                          );
                        default:
                          if (snapshot.hasError) {
                            return const Text("");
                          } else {
                            List<CategoriesProduct> data = snapshot.data;
                            return SizedBox(
                              height: 542,
                              child: GridView.builder(
                                  gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 310,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 10,
                                      crossAxisCount: 2),
                                  itemCount: data.length,
                                  itemBuilder: (context, position) {
                                    return drewProductGrid(
                                        data[position]);
                                  }),
                            );
                          }
                      }
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget drewProductGrid(CategoriesProduct data) {
    return Stack(
      children: [
        Card(
          elevation: 5,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Column(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        data.image ??
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
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                data.name.toString(),
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              // (discountData[position].discount != null)
              Column(
                children: [
                  (data.discountPrice == null)
                      ? Text(
                    "EGP ${data.price.toString()}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                        fontSize: 14),
                  )
                      : Column(
                    children: [
                      Text(
                        "EGP ${data.discountPrice.toString()}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                            fontSize: 16),
                      ),
                      Text(
                        "EGP ${data.price.toString()}",
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.orangeAccent.shade200,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                            fontSize: 13),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(
                EvaIcons.shoppingCartOutline,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                EvaIcons.heartOutline,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
