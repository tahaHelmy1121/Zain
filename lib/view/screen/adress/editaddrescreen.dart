
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:shop/view/screen/adress/editaddress.dart';

import '../../../model/adress/editaddress.dart';
import '../../customdrawer.dart';
import '../../widget/custom/customappbar.dart';


class EditView extends StatefulWidget {
  final EditAddressUser? getEditAddress;

  EditView({this.getEditAddress});

  @override
  _EditViewState createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  int current = 1;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: Custom(),
      appBar: AppBar(
        flexibleSpace: MyAppBar(),
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "تعديل عنوان",
        ),
        toolbarHeight: 55,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage(
                            "assets/image/Directions-bro.png"),
                        fit: BoxFit.contain)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  EditAddress(
                    getEdit: widget.getEditAddress,
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
