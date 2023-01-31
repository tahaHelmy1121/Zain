import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
  import 'dart:io';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:shop/view/screen/about/about.dart';
import 'package:shop/view/screen/auth/login.dart';
import 'package:shop/view/screen/chat/chat.dart';
import 'package:shop/view/screen/home/compenmet/homeview.dart';
import 'package:shop/view/screen/home/home.dart';
import 'package:shop/view/screen/productdetails/products.dart';
import 'package:shop/view/settings.dart';

import '../../../model/drawermodel.dart';


class Custom extends StatefulWidget {
  @override
  _CustomState createState() => _CustomState();
}

class _CustomState extends State<Custom> {
  static int customerToken = 0;
  List<DrawerModel> drawerMenu = [



  ];
  List<Icon> myIconDrawer = [
      Icon(
      EvaIcons.homeOutline,
      color: Color(0xff3A6073),
    ),
    const Icon(
      EvaIcons.person,
      color: Color(0xff3A6073),
    ),
    const Icon(
      EvaIcons.browser,
      color: Color(0xff3A6073),
    ),
    const Icon(
      EvaIcons.logInOutline,
      color: Color(0xff3A6073),
    ),
    const Icon(
      EvaIcons.logInOutline,
      color: Color(0xff3A6073),
    ),
    const Icon(
      EvaIcons.logInOutline,
      color: Color(0xff3A6073),
    ),
  ];

  checkAuth() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    customerToken = sharedPreferences.getInt('customerId')!;
    if (customerToken == 0||customerToken==null) {
      setState(() {
        drawerMenu.add(
          DrawerModel(title: 'الرئيسية', nav: () => HomeView(id: 0,)),
        );
        drawerMenu.add(
          DrawerModel(title: 'المنتجات', nav: () => Products()),
        );
        drawerMenu.add(
          DrawerModel(title: 'اتصل بنا', nav: () => Chat()),
        );
        // drawerMenu.add(
        //   DrawerModel(title: 'عنا', nav: () => About()),
        // );
        drawerMenu.add(
          DrawerModel(title: 'خروج', nav: () => Login()),
        );
      }
      );
    }else{
      setState(() {
        drawerMenu.add(
          DrawerModel(title: 'الرئيسية', nav: () => HomeView(id:  0 ,)),
        );
        drawerMenu.add(
          DrawerModel(title: 'المنتجات', nav: () => Products()),
        );
        drawerMenu.add(
          DrawerModel(title: 'الإعدادات', nav: () => Settings()),
        );
        drawerMenu.add(
          DrawerModel(title: 'اتصل بنا', nav: () => Chat()),
        );
        // drawerMenu.add(
        //   DrawerModel(title: 'عنا', nav: () => About()),
        // );
        drawerMenu.add(
          DrawerModel(title: 'تسجيل الخروج', nav: () => Login()),
        );
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 510,
        width: 183,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(7),
              bottomLeft: Radius.circular(7),
            )),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.only(top: 320),
                height: 150,
                width: 170,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image:
                    ExactAssetImage("assets/image/undraw_jewelry_iima.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              child: ListView.builder(
                  itemCount: drawerMenu.length,
                  itemBuilder: (context, position) {
                    return Column(
                      children: [
                        ListTile(
                          leading: myIconDrawer[position],
                          title: Text(
                            drawerMenu[position].title,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                            style:
                            const TextStyle(fontSize: 14.0, fontFamily: "BigVesta"),
                          ),
                          onTap: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                                  return drawerMenu[position].nav();
                                }), (route) => false);
                          },
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
