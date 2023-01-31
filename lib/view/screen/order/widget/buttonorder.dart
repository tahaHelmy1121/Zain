//   import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../../core/datasourse/dynamic/order/order.dart';
// import '../../../../model/cart/promocode.dart';
// import '../../../../model/cart/skipmodel.dart';
// import '../../../../model/order/ordermodel.dart';
// import '../ordershow.dart';
//
//      class CustomButtonOrder extends StatefulWidget {
//        final PromoCodeModel? pro;
//        final SkipMode? skip;
//
//        final int? recentAdded;
//         CustomButtonOrder({Key? key, this.pro, this.skip, this.recentAdded}) : super(key: key);
//
//        @override
//        State<CustomButtonOrder> createState() => _CustomButtonOrderState();
//      }
//
//      class _CustomButtonOrderState extends State<CustomButtonOrder> {
//        int xdCustomer = 0;
//
//        getCustomerId() async {
//          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//          setState(() {
//            xdCustomer = sharedPreferences.getInt('customerId')!;
//          });
//        }
//
//        int? countrySelected;
//        @override
//        Widget build(BuildContext context) {
//          return
//        }
//      }
//
