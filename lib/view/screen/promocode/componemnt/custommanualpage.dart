    import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/datasourse/dynamic/cart/promocode.dart';
import '../../../../core/datasourse/dynamic/cart/skip.dart';
import '../../../../model/cart/promocode.dart';
import '../../../../model/cart/skipmodel.dart';
import '../../order/ordersure.dart';

    class ManualPageCustom extends StatefulWidget {
      const ManualPageCustom({Key? key}) : super(key: key);

      @override
      State<ManualPageCustom> createState() => _ManualPageCustomState();
    }

    class _ManualPageCustomState extends State<ManualPageCustom> {
      @override
      Widget build(BuildContext context) {
        var nameAdd;
        GlobalKey<FormState> addPromoKey = GlobalKey<FormState>();
        int xdCustomer = 0;
        getCustomerId() async {
          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          setState(() {
            xdCustomer = sharedPreferences.getInt('customerId')!;
          });
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 400,
                child: Lottie.asset("assets/lotti/code.json"),
                height: 250,

              ),
              const SizedBox(
                height: 25,
              ),
              Form(
                key: addPromoKey,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0, left: 20),
                  child: TextFormField(
                    style: const TextStyle(
                        fontFamily: "BigVesta",
                        fontSize: 14.0,
                        color: Color(0xff16222A),
                        fontWeight: FontWeight.w400),
                    textDirection: TextDirection.rtl,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "أدخل البروموكود ";
                      }
                      setState(() {
                        nameAdd = value;
                      });
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(fontFamily: "BigVesta"),
                      hintText: "promoCode",
                      label: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          child: const Text("promo")),
                      hintStyle: const TextStyle(
                          fontFamily: "BigVesta",
                          fontSize: 14.0,
                          color: Color(0xff16222A),
                          fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      filled: true,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 150,
                height: 60,
                child: MaterialButton(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  onPressed: () async {
                    if (addPromoKey.currentState!.validate()) {
                      PromoCodeModel promoCode = PromoCodeModel();
                      await PromoData.sendCode(xdCustomer, nameAdd)
                          .then((value) {
                        promoCode = value;
                        if (promoCode.status == 0 || promoCode.total == null) {
                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                              content: Center(
                                child: Text(
                                  promoCode.reason!,
                                  style: const TextStyle(fontFamily: "BigVesta"),
                                ),
                              ),
                              duration: const Duration(milliseconds: 100),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                              ),
                              elevation: 10,
                            ));
                        } else {
                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                              content: Text(
                                promoCode.reason!,
                                style: const TextStyle(fontFamily: "BigVesta"),
                              ),
                              duration: const Duration(milliseconds: 50),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                              ),
                              elevation: 10,
                              onVisible: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                         return OrderSure(pro: promoCode);
                                    }));
                              },
                            ));
                        }
                      });
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Center(
                      child: Text(
                        "إرسال",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            height: 2,
                            fontFamily: "BigVesta",
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: InkWell(
                  onTap: () async {
                    SkipMode skip = SkipMode();
                    await SkipData.skipCode(xdCustomer).then((value) {
                      skip = value;
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                             return OrderSure(
                               skip: skip
                           // return const Text("o");
                             );
                          }), (route) => false);
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        EvaIcons.chevronRight,
                        size: 20,
                      ),
                      Text(
                        "تخطي",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            height: 2,
                            fontFamily: "BigVesta",
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    }
