import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constant/style.dart';
import '../../../core/datasourse/dynamic/cart/cartdata.dart';
import '../../../core/datasourse/dynamic/cart/remove.dart';
import '../../../core/datasourse/dynamic/cart/showcart.dart';

import '../../../model/cart/cartshow.dart';
import '../../../model/cart/removecart.dart';
import '../../customdrawer.dart';
import '../../widget/custom/customappbar.dart';
import '../productdetails/products.dart';
import '../promocode/promocode.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int xdCustomer = 0;
  late int firsQ;

  getCustomerId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      xdCustomer = sharedPreferences.getInt('customerId')!;
    });
  }

  @override
  void initState() {
    getCustomerId();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var hightScreen = MediaQuery.of(context).size.height;
    var widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer: Custom(),
      appBar: AppBar(
        flexibleSpace: MyAppBar(),
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "السلة",
          style: Style.style1,
        ),
        toolbarHeight: 55,
      ),
      body: FutureBuilder(
          future: ShowCartData.showCartController(xdCustomer),
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
                  CartShow cartShow = snapshot.data;

                  if (cartShow.products!.isEmpty) {
                    return Center(
                      child: Lottie.asset("assets/lotti/waze.json"),
                    );
                  } else {
                    return Column(
                      children: [
                        Flexible(
                          child: ListView.separated(
                              separatorBuilder: (context, position) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Container(
                                    height: 0.2,
                                    color: Colors.orangeAccent,
                                  ),
                                );
                              },
                              itemCount: cartShow.products!.length,
                              itemBuilder: (context, position) {
                                firsQ = cartShow.products![position].quantity;
                                return Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                        height: hightScreen*0.2,
                                        width: double.infinity,
                                        child: Stack(children: [
                                          Card(
                                            elevation: 7,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                DropdownButton(
                                                    iconEnabledColor:
                                                        Colors.black,
                                                    value: firsQ,
                                                    icon: const Icon(Icons
                                                        .keyboard_arrow_down),
                                                    items: cartShow
                                                        .products![position]
                                                        .listQuantity
                                                        ?.map((int items) {
                                                      return DropdownMenuItem(
                                                          value: items,
                                                          child: Text(items
                                                              .toString()));
                                                    }).toList(),
                                                    onChanged: (int? value) {
                                                      setState(
                                                        () async {
                                                          firsQ = value!;
                                                          await Cartdata
                                                              .addToCart(
                                                            customerId:
                                                                xdCustomer,
                                                            productId: cartShow
                                                                .products![
                                                                    position]
                                                                .productId,
                                                            price: cartShow
                                                                .products![
                                                                    position]
                                                                .price,
                                                            quantity: firsQ,
                                                            quantityEqual: 0,
                                                            colorId: cartShow
                                                                .products![
                                                                    position]
                                                                .colorId,
                                                            sizeId: cartShow
                                                                .products![
                                                                    position]
                                                                .sizeId,
                                                          ).then((value) {
                                                          });
                                                        },
                                                      );
                                                      SizedBox(
                                                        width: widthScreen*0.2,
                                                        height: 30,
                                                        child: Text(
                                                          cartShow
                                                              .products![
                                                                  position]
                                                              .cartstatus
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          textDirection:
                                                              TextDirection.ltr,
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                            height: 1,
                                                            fontSize: 8,
                                                            fontFamily:
                                                                "BigVesta",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors
                                                                .red.shade900,
                                                          ),
                                                        ),
                                                      );

                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            child: Text(
                                                              cartShow
                                                                  .products![
                                                                      position]
                                                                  .total
                                                                  .toString(),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    "BigVesta",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 2,
                                                          ),
                                                          const Text(
                                                            "إجمالي المنتج: ",
                                                            textDirection:
                                                                TextDirection
                                                                    .rtl,
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "BigVesta",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Colors
                                                                  .lightBlue,
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    }),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: widthScreen*0.1,
                                                      child: Text(
                                                        cartShow
                                                            .products![position]
                                                            .productName,
                                                        textDirection:
                                                            TextDirection.rtl,
                                                        style: const TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize: 12,
                                                          fontFamily: "Nunito",
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 2),
                                                      child: Container(
                                                        width: 100,
                                                       // height: 700,
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              "${cartShow.products![position].price.toString()}ج",
                                                              textDirection:
                                                                  TextDirection
                                                                      .rtl,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    "Nunito",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                            Text(
                                                              "${cartShow.products![position].total.toString()}الاجمالى",
                                                              textDirection:
                                                                  TextDirection
                                                                      .rtl,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    "Nunito",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    // drewInfoCartProduct(cartShow
                                                    //     .products![position]
                                                    //     .colorName),
                                                    Text(
                                                      cartShow
                                                          .products![position]
                                                          .sizeName,
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      style: const TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: 10,
                                                        fontFamily: "Nunito",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 3,
                                                ),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 140,
                                                        width: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            7)),
                                                                image:
                                                                    DecorationImage(
                                                                  image: NetworkImage(cartShow
                                                                      .products![
                                                                          position]
                                                                      .productImage),
                                                                  fit: BoxFit
                                                                      .contain,
                                                                )))),
                                                IconButton(
                                                  onPressed: () {
                                                    AwesomeDialog(
                                                            btnOkColor: Colors
                                                                .red,
                                                            btnOkOnPress:
                                                                () async {
                                                              RemoveCartModel
                                                                  removeCartModel =
                                                                  RemoveCartModel();
                                                              await RemoveData.removeControllerCart(cartShow
                                                                      .products![
                                                                          position]
                                                                      .id)
                                                                  .then(
                                                                      (value) {
                                                                removeCartModel =
                                                                    value;
                                                                setState(() {});
                                                                ScaffoldMessenger
                                                                    .of(context)
                                                                  ..removeCurrentSnackBar()
                                                                  ..showSnackBar(
                                                                      SnackBar(
                                                                    content:
                                                                        Text(
                                                                      removeCartModel
                                                                          .reason
                                                                          .toString(),
                                                                      style: const TextStyle(
                                                                          fontFamily:
                                                                              "BigVesta"),
                                                                    ),
                                                                    duration: const Duration(
                                                                        seconds:
                                                                            1),
                                                                    shape:
                                                                        const RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(15),
                                                                        topRight:
                                                                            Radius.circular(15),
                                                                      ),
                                                                    ),
                                                                    elevation:
                                                                        10,
                                                                  ));
                                                              });
                                                            },
                                                            btnOkText: "حذف",
                                                            context: context,
                                                            width: double
                                                                .infinity,
                                                            dismissOnTouchOutside:
                                                                false,
                                                            buttonsBorderRadius:
                                                                const BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                            animType:
                                                                AnimType
                                                                    .LEFTSLIDE,
                                                            dialogType:
                                                                DialogType
                                                                    .ERROR,
                                                            buttonsTextStyle:
                                                                const TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "BigVesta",
                                                            ),
                                                            body: const Text(
                                                              "هل تريد حذف هذا المنتج ؟",
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    "BigVesta",
                                                              ),
                                                            ),
                                                            btnCancelColor:
                                                                Colors.black38,
                                                            btnCancelText:
                                                                "إلغاء",
                                                            btnCancelOnPress:
                                                                () {})
                                                        .show();
                                                  },

                                                  icon: Icon(
                                                    EvaIcons.closeSquare,
                                                    color: Colors
                                                        .redAccent.shade700,
                                                  ),
                                                ),
                                              ],

                                            ),

                                          ),

                                        ],

                                    )
                                    )

                                );
                              }),
            ),

                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(50)
                              ),

                              height: 45,
                              width: widthScreen*0.5,
                              alignment: Alignment.topCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 70,
                                    child: Text(
                                      " ج${cartShow.totalCart.toString()}",
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "BigVesta",
                                      ),
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.rtl,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 100,
                                    decoration: const BoxDecoration(),
                                    child: const Text(
                                      "إجمالي الطلب",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: "BigVesta",
                                        wordSpacing: 1,
                                        letterSpacing: 2,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(height: 12,),
                        Container(
                          height: 70,
                          width: double.infinity,
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return PromoCode();
                                        }));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 150,
                                    margin: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(25),
                                        topRight: Radius.circular(25),
                                        topLeft: Radius.circular(25),
                                        bottomLeft: Radius.circular(25),
                                      ),
                                    ),
                                    child: const Text(
                                      " إتمام الشراء",
                                      style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w200,
                                          fontFamily: "BigVesta",
                                          wordSpacing: 1,
                                          letterSpacing: 2,
                                          color: Colors.teal),
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return Products();
                                        }));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 70,
                                    width: 100,
                                    margin: const EdgeInsets.all(3),
                                    decoration: const BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(25),
                                        topRight: Radius.circular(25),
                                        topLeft: Radius.circular(25),
                                        bottomLeft: Radius.circular(25),
                                      ),
                                    ),
                                    child: const Text(
                                      "الرجوع للتسوق",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w200,
                                          fontFamily: "BigVesta",
                                          wordSpacing: 1,
                                          letterSpacing: 2,
                                          color: Colors.teal),
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    );
                  }
                }
            }
          }),
    );
  }
}
