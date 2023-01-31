import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/core/datasourse/dynamic/order/ordersshow.dart';
import 'package:shop/model/order/orderdetails.dart';

import '../../../core/datasourse/dynamic/order/orderdetails.dart';
import '../../../model/order/ordershowmodel.dart';
import '../../customdrawer.dart';
import 'orderdetails.dart';

class OrderShow extends StatefulWidget {
  const OrderShow({Key? key}) : super(key: key);

  @override
  State<OrderShow> createState() => _OrderShowState();
}

class _OrderShowState extends State<OrderShow> {
  int xdCustomer = 0;

  getCustomerId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      xdCustomer = sharedPreferences.getInt('customerId')!;
    });
  }

  @override
  void initState() {
    super.initState();
    getCustomerId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: Custom(),
        appBar: AppBar(

          backgroundColor: Colors.grey,
          centerTitle: true,
         title: Text("عرض المنتجات",style:TextStyle(fontWeight: FontWeight.bold,letterSpacing: 4,color: Colors.black),),
        ),
        body: FutureBuilder(
            future: OrdersShowData.getOrdersShow(xdCustomer),
            builder: (context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.active:
                case ConnectionState.none:
                  return CircularProgressIndicator();
                default:
                  if (snapshot.hasError) {
                    return const Text("");
                  } else {
                    List<OrderShowModel> data = snapshot.data;
                    if (data.isEmpty) {
                      return Center(
                        child: Container(
                          width: 250,
                          height: 250,
                          child: Lottie.asset("assets/lotti/nodata.json"),
                        ),
                      );
                    } else {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.separated(
                            separatorBuilder: (context, position) {
                              return Container(
                                width: double.infinity,
                                height: .5,
                                color: Colors.black,
                              );
                            },
                            itemBuilder: (context, position) {
                              return InkWell(
                                onTap: () async {
                                  OrderDetailsModel orderDetails =
                                      OrderDetailsModel();
                                  await OrdersDetailsData.getOrdersDetails(
                                          data[position].id!)
                                      .then((value) {
                                    orderDetails = value;
                                  });
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return OrderDetails(
                                      data: orderDetails,
                                    );
                                  }));
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  elevation: 5,
                                  child: SizedBox(
                                    height: 250,
                                    width:120,
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                width: 150,
                                                child: Text(
                                                  data[position]
                                                      .createDateTime!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                    fontFamily: "BigVesta",
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              const Text(
                                                "تاريخ الطلب :",
                                                textDirection:
                                                    TextDirection.rtl,
                                                style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 16.0,
                                                  fontFamily: "BigVesta",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    right: 12),
                                                alignment: Alignment.center,
                                                width: 150,
                                                child: Text(
                                                  data[position]
                                                      .address
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.0,
                                                    fontFamily: "BigVesta",
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              const Text(
                                                "عنوان الطلب :",
                                                textDirection:
                                                    TextDirection.rtl,
                                                style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 16.0,
                                                  fontFamily: "BigVesta",
                                                  letterSpacing: 3,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                width: 150,
                                                child: Text(
                                                  data[position]
                                                      .orderTotal
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.0,
                                                    fontFamily: "BigVesta",
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              const Text(
                                                "إجمالي الطلب :",
                                                textDirection:
                                                    TextDirection.rtl,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0,
                                                  fontFamily: "BigVesta",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                width: 150,
                                                child: Text(
                                                  data[position]
                                                      .orderStatus
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    color: Colors.lightBlue,
                                                    fontSize: 14.0,
                                                    fontFamily: "BigVesta",
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              const Text(
                                                "حالة الطلب :",
                                                textDirection:
                                                    TextDirection.rtl,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0,
                                                  fontFamily: "BigVesta",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: data.length,
                          ));
                    }
                  }
              }
            }));
  }
}
