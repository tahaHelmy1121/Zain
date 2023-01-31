import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/view/screen/home/home.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/function/translatedatabase.dart';
import '../../../../model/homepage/categoriesparent.dart';
import 'homeview.dart';


class Category extends StatefulWidget {
  final List<CategoriesParent > data ;

  Category({required this.data});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  int cases = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 40),
      width: double.infinity,
      height: 40,
      child:    ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.data.length,
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  width: 130,
                  margin: const EdgeInsets.all(3),
                  decoration:  const BoxDecoration(
                    gradient: LinearGradient(colors:[
                      AppColor.fourthColor,
                      AppColor.secondColor,
                    ]),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                  ),
                  child: Text(
                      widget.data[position].name!,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                        fontFamily: "BigVesta",
                        wordSpacing: 1,
                        letterSpacing: 2,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ),

                onTap: () {
                  Get.offAll(Home(id: widget.data[position].id!,));
                },
              ),
            );
          }),
    );
  }
}
