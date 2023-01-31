import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/view/screen/cart/cart.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/style.dart';
import '../../../core/datasourse/dynamic/homedata/homedata.dart';
import '../../../model/homepage/homemodel.dart';
import '../../customdrawer.dart';
import '../../widget/custom/customappbar.dart';
import 'compenmet/categoryparent.dart';
import 'compenmet/drewsubcategory.dart';
import 'compenmet/namecategories.dart';
import 'compenmet/slider.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
class Home extends StatefulWidget {
  final int id;

//  GetxNetWorkController? getxnetwork = Get.find<GetxNetWorkController>();
  Home({
    super.key,
    required this.id,
  });

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home>with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    int xdCustomer = 0;
    bool cases = true;
    var connectivityResult = (Connectivity().checkConnectivity());

    Future<bool> check() async {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        return true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        return true;
      }
      return false;
    }

    getCustomerId() async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      setState(() {
        xdCustomer = sharedPreferences.getInt('customerId')!;
      });
    }
    @override
    void initState() {
      getCustomerId();
      check().then((internet) {
        if (internet == null || internet == false) {
          setState(() {
            cases = false;
          });
        }
      });
      super.initState();
    }

    int current = 1;





    return Scaffold(

      appBar: AppBar(
        flexibleSpace: MyAppBar(),
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "الرئيسية",
          style: Style.style1,
        ),
        toolbarHeight: 55,
      ),
      endDrawer: Custom(),
      body: cases == true
          ? FutureBuilder(
              future:
                  HomeData.getHome(customerId: xdCustomer, parentId: widget.id),
              builder: (context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.active:
                  case ConnectionState.none:
                    return Container(
                        child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ));
                  default:
                    if (snapshot.hasError) {
                      return const Text("");
                    } else {
                      HomePageModel homePageModel = snapshot.data;
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Category(data: homePageModel.categoriesParent!),
                            SizedBox(
                              height: 8,
                            ),

                            WidegtName(" تصنيفات المنتجات"),
                            DrewSubCategory(
                              data: homePageModel.categoriesSup!,
                            ),
                            DrewCarousel(data: homePageModel.categoriesSlider!),
                            const Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.orangeAccent,
                            ),
                            NameSubCategoryHomePage(
                              data: homePageModel.categoriesSup!,
                              categoryParent: widget.id,
                            ),
                          ],
                        ),
                      );
                    }
                }
              })
          : Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 550,
        child: Lottie.asset("assets/lotti/wifi.json"),
      ),
    );
  }

  WidegtName(String part) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          part,
          textAlign: TextAlign.right,
          style: const TextStyle(
              fontSize: 15,
              color: AppColor.grey,
              fontFamily: "BigVesta",
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
// Container(
// width: 100,
// height: 100,
// decoration: BoxDecoration(
// image: const DecorationImage(
// image: AssetImage("assets/image/pic6.jpg",),
// fit: BoxFit.cover,
// // opacity: 0.4
// ),
// //  color: Colors.black,
// borderRadius: BorderRadius.circular(25)
// ),
//
// ),
