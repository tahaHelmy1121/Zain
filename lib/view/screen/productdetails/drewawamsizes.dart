import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/datasourse/dynamic/cart/cartdata.dart';
import '../../../model/cart/cartmodel.dart';
import '../../../model/productdetails/productdetailsmodel.dart';
import '../auth/login.dart';
import '../cart/cart.dart';

class DrewSizes extends StatefulWidget {
  final ModelDetails data;

  DrewSizes({required this.data});

  @override
  _DrewSizesState createState() => _DrewSizesState();
}

class _DrewSizesState extends State<DrewSizes> {
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 220,
                height: 35,
                child: CustomRadioButton(
                  enableButtonWrap: false,
                  customShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  width: 70,
                  defaultSelected: widget.data.sizes![0].id,
                  horizontal: false,
                  enableShape: true,
                  elevation: 0,
                  absoluteZeroSpacing: true,
                  unSelectedColor: Theme.of(context).canvasColor,
                  buttonLables: List.generate(widget.data.sizes!.length,
                      (index) => widget.data.sizes![index].size!),
                  buttonValues:
                      List.generate(widget.data.sizes!.length, (index) {
                    return widget.data.sizes![index].id;
                  }),
                  buttonTextStyle: const ButtonTextStyle(
                      selectedColor: Colors.white,
                      unSelectedColor: Colors.black,
                      textStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        fontFamily: "BigVesta",
                      )),
                  radioButtonValue: (value) {
                    setState(() {
                      x = value!;
                    });
                  },
                  selectedColor: Theme.of(context).accentColor,
                ),
              ),
              const Text(
                'مقاسات المنتج :',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 12.0,
                    fontFamily: "BigVesta",
                    color: Colors.orangeAccent),
              ),
            ],
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
                  borderRadius: BorderRadius.circular(100),
                ),
                child: MaterialButton(
    color: Colors.black,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    onPressed: ()  {
                      if (xdCustomer == 0 || xdCustomer == null) {
                        AwesomeDialog(
                            btnOkColor: Colors.black54,
                            btnOkOnPress: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const Login();
                                  }));
                            },
                            btnOkText: "تسجيل الدخول",
                            context: context,
                            width: double.infinity,
                            dismissOnTouchOutside: false,
                            buttonsBorderRadius:
                            const BorderRadius.all(Radius.circular(20)),
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
                            btnCancelColor: Colors.black54,
                            btnCancelText: "إلغاء",
                            btnCancelOnPress: () {})
                            .show();
                      } else {
                        CartModel cartModel = CartModel();
                        Cartdata.addToCart(
                          customerId: xdCustomer,
                          productId: widget.data.id,
                          price: widget.data.price,
                          quantity: 1,
                          quantityEqual: 0,
                          //  colorId: widget.data.colors![0].id,
                          sizeId: x,
                        ).then((value) {
                          cartModel = value;
                        });
                        ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(SnackBar(
                            content: Text(
                              cartModel.reason.toString(),
                              style: const TextStyle(fontFamily: "BigVesta"),
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
                              Get.offAll(Cart());
                            },
                          ));
                      }
                    },
    child: Center(
      child: const Text(
      "إضافة الي السلة",
      style: TextStyle(fontFamily: "BigVesta",color: Colors.white,fontSize: 8),

      ),
    )
    )
    )
    )
    )
    )
    ]
    );

  }
}
