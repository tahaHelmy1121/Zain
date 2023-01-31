import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../core/datasourse/dynamic/setting/settingdata.dart';
import '../../../model/setting/settingmodel.dart';
import '../../screen/auth/login.dart';
import '../../screen/cart/cart.dart';

class MyAppBar extends StatefulWidget {
  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  SettingModel settingModel = SettingModel();
  int xdCustomer = 0;

  getCustomerId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      xdCustomer = sharedPreferences.getInt('customerId')!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getCustomerId();
    // getMoreInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      child: FutureBuilder(
          future: SettingData.getSettings(customerId: xdCustomer),
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
                  SettingModel data = snapshot.data;
                  return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(children: [
                          IconButton(
                            padding: const EdgeInsets.all(5),
                            iconSize: 20,
                            onPressed: () {},
                            icon:
                                const Icon(EvaIcons.bellOutline, color: Colors.white),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 28, top: 10),
                            alignment: Alignment.center,
                            height: 17,
                            width: 17,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              (data.notification >= 100)
                                  ? "+99"
                                  : data.notification.toString(),
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontFamily: "BigVesta",
                              ),
                            ),
                          ),
                        ]),
                        const SizedBox(width: 5,),
                        Stack(
                          children: [
                            IconButton(
                              iconSize: 20,
                              onPressed: () {
                                if (xdCustomer == 0 || xdCustomer == null) {
                                  AwesomeDialog(
                                      btnOkColor: Colors.black54,
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
                                          const BorderRadius.all(Radius.circular(20)),
                                      animType: AnimType.LEFTSLIDE,
                                      dialogType: DialogType.ERROR,
                                      buttonsTextStyle: const TextStyle(
                                        fontSize: 8,
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
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Cart();
                                  }));
                                }
                              },
                              icon: const Icon(
                                EvaIcons.shoppingCartOutline,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 28, top: 10),
                              alignment: Alignment.center,
                              height: 17,
                              width: 17,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                (data.notification >= 100)
                                    ? "+99"
                                    : data.cart.toString(),
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontFamily: "BigVesta",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]);
                }
            }
          }),
    );
  }
}
