import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/core/constant/style.dart';
import 'package:shop/view/screen/adress/showaddress.dart';
import 'package:shop/view/screen/order/ordershow.dart';
import 'package:shop/view/screen/profile/profile.dart';
import 'package:shop/view/widget/custom/customappbar.dart';

import '../../../core/datasourse/dynamic/setting/settingdata.dart';
import '../../../model/setting/settingmodel.dart';
import '../../customdrawer.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
    super.initState();
    getCustomerId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Custom(),
      appBar: AppBar(
        flexibleSpace: MyAppBar(),
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "الإعدادات",
          style: Style.style2,
        ),
        toolbarHeight: 55,
      ),
      body: FutureBuilder(
          future: SettingData.getSettings(customerId: xdCustomer),
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
                  SettingModel data=snapshot.data;
                  if(data==null){
                    return const Text("لايوجد بيانات متاحة الان");
                  }else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return ProfileShow();
                                    }));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(3),
                                width: 150,
                                height: 150,
                                decoration: const BoxDecoration(
                                  color: Color(0xff20002c),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(50),
                                    topLeft: Radius.circular(50),
                                    bottomLeft: Radius.circular(50),
                                  ),
                                ),
                                child: const Text(
                                  "حسابي      ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: "BigVesta"),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return ShowAddress();
                                    }));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(3),
                                width: 150,
                                height: 150,
                                decoration: const BoxDecoration(
                                  color: Color(0xff536976),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(50),
                                    topLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "العناوين",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: "BigVesta"),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      data.address.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: "BigVesta"),
                                    ),

                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(3),
                              width: 150,
                              height: 150,
                              decoration: const BoxDecoration(
                                color: Color(0xffC33764),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "المفضله",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: "BigVesta"),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    data.fav.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: "BigVesta"),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return OrderShow();
                                }));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 150,
                                height: 150,
                                margin: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                    color: Color(0xff200122),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(50),
                                      bottomRight: Radius.circular(50),
                                      bottomLeft: Radius.circular(50),
                                      // bottomLeft: Radius.circular(30),
                                    )),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "طلباتي  ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: "BigVesta"),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      data.orders.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: "BigVesta"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                }
            }
          }),
    );
  }
}
