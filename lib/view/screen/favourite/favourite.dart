import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constant/style.dart';
import 'package:shop/view/screen/home/home.dart';
import 'package:shop/view/screen/productdetails/drewawamsizes.dart';

import '../../customdrawer.dart';

class Favourite extends StatefulWidget {
  final dynamic productId;
  final String? name;
  final String? image;
  final dynamic colorId;

  const Favourite(
      {Key? key, this.productId, this.name, this.colorId, this.image})
      : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: Custom(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Favourite",
            style: Style.style1,
          ),
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey),
                  width: double.infinity,
                  height: 250,
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                            image: NetworkImage("${widget.image}"),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 250,
                        height: 150,
                      ),
                      Container(
                        child: Text(widget.name!,
                            style:
                                TextStyle(fontSize: 14, color: Colors.white)),
                        margin: EdgeInsets.only(top: 18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 250,
                        height: 150,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      Get.offAll(Home(
                        id: 0,
                      ));
                    },
                    child: Container(
                      child: Center(
                          child: Text(
                        "Zain",
                        style: TextStyle(fontSize: 18, letterSpacing: 2),
                      )),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(25)),
                      margin: EdgeInsets.only(top: 250),
                      width: 100,
                      height: 100,
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
