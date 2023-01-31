
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/core/datasourse/dynamic/address/show.dart';
import 'package:shop/core/datasourse/dynamic/order/order.dart';
import 'package:shop/view/screen/order/widget/buttonorder.dart';
import '../../../model/adress/showaddress.dart';
import '../../../model/cart/promocode.dart';
import '../../../model/cart/skipmodel.dart';
import '../../../model/order/ordermodel.dart';
import '../../customdrawer.dart';
import '../../widget/custom/customappbar.dart';
import '../adress/addadress.dart';
import 'ordershow.dart';


class OrderSure extends StatefulWidget {
  final PromoCodeModel? pro;
  final SkipMode? skip;

  final int? recentAdded;

  OrderSure({
    this.recentAdded,
    this.skip,
    this.pro,
  });

  @override
  _OrderSureState createState() => _OrderSureState();
}

class _OrderSureState extends State<OrderSure> {
  int xdCustomer = 0;

  getCustomerId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      xdCustomer = sharedPreferences.getInt('customerId')!;
    });
  }

  int? countrySelected;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomerId();
  }

  var x;

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
        title: const Text(
          "تاكيد الطلب",
        ),
        toolbarHeight: 55,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage(
                          "assets/image/undraw_heavy_box_agqi.png"),
                      fit: BoxFit.contain)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FutureBuilder(
                    future: ShowAddressData.showAddress(xdCustomer),
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
                            List<ShowAddressModel> address = [
                              ShowAddressModel(
                                id: 0,
                                countryId: 0,
                                addressAddress1: "",
                                addressFirstName: "إضافة عنوان",
                                countryName: "",
                                customerId: 0,
                                mobile: "",
                                regionId: 0,
                                regionName: "",
                              )
                            ];
                            address.addAll(snapshot.data);
                            if (widget.recentAdded == 0 ||
                                widget.recentAdded == null) {
                              countrySelected = (address.length<=1)?address.first.id: address.skip(1).first.id;
                            } else {
                              address.forEach((element) {
                                countrySelected = element.id;
                              });
                            }

                            x = address.first.id;
                            return Container(
                              width: 150,
                              child: Column(
                                children: [
                                  DropdownButtonFormField(

                                    iconEnabledColor: Colors.orangeAccent,
                                    value: countrySelected,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: address.map((var items) {
                                      return DropdownMenuItem(
                                          value: items.id,
                                          child: Container(
                                            margin: const EdgeInsets.only(left: 20),
                                            alignment: Alignment.center,
                                            width: 100,
                                            height: 25,
                                            child: (items.id == 0)
                                                ? Text(
                                              '${items.addressFirstName.toString()}',
                                              textDirection:
                                              TextDirection.rtl,
                                              maxLines: 1,
                                              overflow: TextOverflow.visible,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: "BigVesta",
                                                  fontSize: 14.0,
                                                  color: Colors.blue.shade700,
                                                  fontWeight:
                                                  FontWeight.w400),
                                            )
                                                : Text(
                                              '${items.addressFirstName.toString()} - ${items.addressAddress1.toString()}',
                                              textDirection:
                                              TextDirection.rtl,
                                              maxLines: 1,
                                              overflow: TextOverflow.visible,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontFamily: "BigVesta",
                                                  fontSize: 14.0,
                                                  color: Colors.black,
                                                  fontWeight:
                                                  FontWeight.w400),
                                            ),
                                          ));
                                    }).toList(),
                                    onChanged: (val) {
                                      countrySelected = val;
                                      if (val == x) {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) {
                                               return AddAddress(
                                                  cartStep: 1,
                                                  pro: widget.pro,
                                                  sx: widget.skip);
                                               }

                                            ));
                                      }
                                    },
                                  ),
                                  SizedBox(height: 25,)
                                ],
                              ),
                            );
                          }
                      }
                    }),
                const Text(
                  "تاكيد العنوان",
                  style: TextStyle(
                      fontFamily: "BigVesta",
                      fontSize: 14.0,
                      color: Color(0xff16222A),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 12,)
              ],
            ),
             SizedBox(
                width: 120,
               height:50,
                child:ElevatedButton(
                  onPressed: () async {
                    OrderModel order = OrderModel();
                    if (widget.pro == null) {
                      await OrderData.orderDone(xdCustomer, countrySelected)
                          .then((value) {
                        order = value;
                      });
                    } else {
                      await OrderData.orderDone(
                          xdCustomer, countrySelected, widget.pro!.total!.code)
                          .then((value) {
                        order = value;
                      });
                    }
                    if (order.status == 2) {
                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                          content: Text(
                            order.reason,
                            style: const TextStyle(fontFamily: "BigVesta"),
                          ),
                          duration: const Duration(milliseconds: 100),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          elevation: 10,
                        ));
                    } else {
                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                          content: Text(
                            order.reason.toString(),
                            style: const TextStyle(fontFamily: "BigVesta"),
                          ),
                          duration: const Duration(milliseconds: 100),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          elevation: 10,
                          onVisible: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                                  return const OrderShow();
                                }), (route) => false);
                          },
                        ));
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black87)),
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "تنفيذ الطلب",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          height: 2,
                          fontFamily: "BigVesta",
                          fontWeight: FontWeight.w500),
                    ),
                  ),

                )


              ),
          ],
        ),
      ),
    );
  }
}
