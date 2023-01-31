import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shop/core/constant/style.dart';
import 'package:shop/view/screen/home/compenmet/subdetails.dart';

import '../../../../model/homepage/categoriessup.dart';

class DrewSubCategory extends StatefulWidget {
  final List<CategoriesSup> data;

  DrewSubCategory({required this.data});

  @override
  _DrewSubCategoryState createState() => _DrewSubCategoryState();
}

class _DrewSubCategoryState extends State<DrewSubCategory> {
  int click = 0;

  @override
  void initState() {
    // TODO: implement initState
    click = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 50),
        height: 150,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 18),
                  child: GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 70,
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image:  DecorationImage(
                            //  fit: BoxFit.cover,
                             // opacity: 0.4,
                            image: NetworkImage(
                                widget.data[index]
                                    .image!),
                          ),
                      ),
                  //
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SubDetails(
                          name: widget.data[index].name.toString(),
                          id: widget.data[index].id!,
                          pa: widget.data[index].parentId!,
                        );
                      }));
                    },
                  ));
            }));
  }
}
