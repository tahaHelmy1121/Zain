import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/view/screen/productdetails/productdetails.dart';

import '../../../model/productdetails/productdetailsmodel.dart';


class DrewColor extends StatefulWidget {
  final ModelDetails data;

  DrewColor({required this.data});

  @override
  _DrewColorState createState() => _DrewColorState();
}

class _DrewColorState extends State<DrewColor> {
  ModelDetails colorData = ModelDetails();

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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
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
              defaultSelected: widget.data.colors![0].id,
              horizontal: false,
              enableShape: true,
              elevation: 0,
              absoluteZeroSpacing: true,
              unSelectedColor: Theme.of(context).canvasColor,
              buttonLables: List.generate(widget.data.colors!.length,
                  (index) => widget.data.colors![index].productColorName),
              buttonValues: List.generate(widget.data.colors!.length, (index) {
                return widget.data.colors![index].id;
              }),
              buttonTextStyle: ButtonTextStyle(
                  selectedColor: Colors.white,
                  unSelectedColor: Colors.black,
                  textStyle: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    fontFamily: "BigVesta",
                  )),
              radioButtonValue: (value) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProductDetails(
                    productId: widget.data.id,
                    colorId: value,
                    name: widget.data.name,
                  );
                }));
              },
              selectedColor: Theme.of(context).accentColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Container(
              width: 100,
              child: Text(
                'الوان المنتج :',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 16.0,
                    fontFamily: "BigVesta",
                    color: Colors.orangeAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
