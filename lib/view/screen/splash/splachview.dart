import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/view/screen/home/home.dart';

import '../auth/login.dart';
import '../home/compenmet/homeview.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  int xdCustomer = 0;
  getCustomerTypeNav(BuildContext context) async {
    SharedPreferences _sharedPreferences =
    await SharedPreferences.getInstance();
    int? _typeValue = _sharedPreferences.getInt("customerId");
    if (_typeValue==0||_typeValue==null) {
      Timer(
        const Duration(seconds: 3),
            () => Navigator.pushAndRemoveUntil(context,
            PageRouteBuilder(pageBuilder: (context, animation, _) {
              return FadeTransition(
                opacity: animation,
                child:  HomeView(id: 0,),
              );
            }), (route) => false),
      );
    } else if (_typeValue == 1) {
      Timer(
        const Duration(seconds: 3),
            () => Navigator.pushAndRemoveUntil(context,
            PageRouteBuilder(pageBuilder: (context,animation,_) {
              return FadeTransition(
                opacity: animation,
                child:  Login(),
              );
            }), (route) => false),
      );
    } else {
      Timer(
        const Duration(seconds: 3),
            () => Navigator.pushAndRemoveUntil(context,
            PageRouteBuilder(pageBuilder: (context, animation, _) {
              return FadeTransition(
                opacity: animation,
                child: HomeView(id:  0 ,),
              );
            }), (route) => false),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomerTypeNav(context);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,BoxConstraints boxConstraint) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: boxConstraint.maxHeight,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: boxConstraint.maxHeight*.35,),
                Container(
                  alignment: Alignment.center,
                  height:500,
                  width: 500,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 200,
                        width:200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: ExactAssetImage(
                                "assets/image/Logo3.png",
                              )),
                        ),
                      ),
                      const CircularProgressIndicator(
                        strokeWidth: 50.0,

                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                SizedBox(height: boxConstraint.maxHeight*.05,),

              ],
            ),
          ),
        ),
      );
    });
  }
}
