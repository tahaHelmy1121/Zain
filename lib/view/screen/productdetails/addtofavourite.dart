import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constant/color.dart';
import '../../../core/datasourse/dynamic/cart/cartdata.dart';
import '../../../core/datasourse/dynamic/favourite/addtofavourite.dart';
import '../../../model/cart/cartmodel.dart';
import '../../../model/favourite/favourite.dart';
import '../../../model/productdetails/productdetailsmodel.dart';
import '../auth/login.dart';
import '../cart/cart.dart';
import '../favourite/favourite.dart';

class CustomFavourite extends StatefulWidget {
  final ModelDetails data;

  CustomFavourite({required this.data});

  @override
  _CustomFavourite createState() => _CustomFavourite();
}

class _CustomFavourite extends State<CustomFavourite> {
  int xdCustomer = 0;
  int x = 0;

  getCustomerId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      xdCustomer = sharedPreferences.getInt('customerId')!;
    });
  }

  @override
  void initState() {
    x = widget.data.sizes![0].id!;
    // TODO: implement initState
    super.initState();
    getCustomerId();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [],
        ),
      ),
      Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                  width: 150,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: MaterialButton(
                          elevation: 0.4,
                          splashColor: AppColor.secondColor,
                          color: AppColor.thirdColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            if (xdCustomer == 0 || xdCustomer == null) {
                              AwesomeDialog(
                                      btnOkColor: AppColor.black,
                                      btnOkOnPress: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder:
                                                (BuildContext context) {
                                          return const Login();
                                        }));
                                      },
                                      btnOkText: "تسجيل الدخول",
                                      context: context,
                                      width: double.infinity,
                                      dismissOnTouchOutside: false,
                                      buttonsBorderRadius:
                                          const BorderRadius.all(
                                              Radius.circular(20)),
                                      animType: AnimType.LEFTSLIDE,
                                      dialogType: DialogType.ERROR,
                                      buttonsTextStyle: const TextStyle(
                                        fontSize: 12,
                                        fontFamily: "BigVesta",
                                      ),
                                      body: const Text(
                                        "انت غير مسجل بمتجر زين",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "BigVesta",
                                        ),
                                      ),
                                      showCloseIcon: true,
                                      btnCancelColor: AppColor.black,
                                      btnCancelText: "إلغاء",
                                      btnCancelOnPress: () {})
                                  .show();
                            } else {
                              FavoriteModel cartModel = FavoriteModel();
                              FavoriteAdd.addFavorite(
                                customerId: xdCustomer,
                              ).then((value) {
                                cartModel = value;
                              });
                              ScaffoldMessenger.of(context)
                                ..removeCurrentSnackBar()
                                ..showSnackBar(SnackBar(
                                  content: Text(
                                    cartModel.reason.toString(),
                                    style:
                                        const TextStyle(fontFamily: "BigVesta"),
                                  ),
                                  duration: const Duration(milliseconds: 35),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
                                  elevation: 10,
                                  onVisible: () {
                                    Get.offAll(Favourite(
                                      productId: widget.data.id,
                                      name: widget.data.name,
                                      image: widget.data.image,
                                    ));
                                  },
                                ));
                            }
                          },
                          child: Center(
                            child: const Text(
                              "إضافة الي المفضلة",
                              style: TextStyle(
                                  fontFamily: "BigVesta",
                                  color: Colors.white,
                                  fontSize: 8),
                            ),
                          ))))))
    ]);
  }
}
