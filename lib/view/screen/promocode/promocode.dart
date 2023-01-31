
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/core/constant/style.dart';
import 'package:shop/view/screen/home/home.dart';
import 'package:lottie/lottie.dart';
import '../../../core/datasourse/dynamic/cart/promocode.dart';
import '../../../core/datasourse/dynamic/cart/skip.dart';
import '../../../model/cart/promocode.dart';
import '../../../model/cart/skipmodel.dart';
import '../../customdrawer.dart';
import '../../widget/custom/customappbar.dart';
import '../order/ordersure.dart';
import 'componemnt/custommanualpage.dart';


class PromoCode extends StatefulWidget {
  @override
  _PromoCodeState createState() => _PromoCodeState();
}

class _PromoCodeState extends State<PromoCode>
    with SingleTickerProviderStateMixin {
  int current = 1;




  String promo = "";
  change(int val) {
    if (val == 0) {
      return Home(id: 0,);
    }
    setState(() {
      current = val;
    });
  }
late  TabController tabController;
  int xdCustomer = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  String qrVal = "";


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

//  PromoCodeModel promoCode = PromoCodeModel();

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
          "بروموكود",
          style: Style.style2,
        ),
        toolbarHeight: 55,
        bottom: TabBar(
            indicatorColor: Colors.orangeAccent,
            unselectedLabelColor: Colors.grey,
            controller: tabController,
            tabs: const [
              Tab(
                  child: Text(
                    "Manual",
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: "BigVesta",
                        fontWeight: FontWeight.w500),
                  )),
              Tab(
                child: Text(
                  "Qr",
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: "BigVesta",
                      fontWeight: FontWeight.w500),
                ),
              ),
            ]),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          ManualPageCustom(),
          qrPage(),
        ],
      ),
    );
  }


  Widget qrPage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 300,
           width: 450,
           child: Lottie.asset("assets/lotti/q.json"),
          ),
          Container(
            margin: const EdgeInsets.only(top: 105),
            child: SizedBox(
              height: 40,
              width: 150,
              child: ElevatedButton(
                onPressed: getQr,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black87)),
                child: const Text(
                  "أقرأ الباركود الخاص بك",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      height: 2,
                      fontFamily: "BigVesta",
                      fontWeight: FontWeight.w500),
                ),
              ),

            ),

          ),
          const SizedBox(height: 12,),
          InkWell(
            onTap: () async {
              SkipMode skip = SkipMode();
              await SkipData.skipCode(xdCustomer).then((value) {
                skip = value;
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                      return OrderSure(
                        skip: skip,
                      );
                      return const Text("");
                    }), (route) => false);
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  EvaIcons.chevronRight,
                  size: 20,
                ),
                Text(
                  "تخطي",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      height: 2,
                      fontFamily: "BigVesta",
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getQr() async {
    try {
      FlutterBarcodeScanner.scanBarcode("#ff6666", "الغاء", true, ScanMode.QR)
          .then((barcode) {
        setState(() {
          promo = barcode;
        });
        send();
      });
    } catch (e) {
      setState(() {
        qrVal = "حدث خطاء";
      });
    }
  }

  send() async {
    PromoCodeModel promoCode = PromoCodeModel();
    await PromoData.sendCode(xdCustomer,promo).then((value) {
      promoCode = value;
      if (promoCode.status == 0 || promoCode.total == null) {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text(
              promoCode.reason!,
              style: const TextStyle(fontFamily: "BigVesta"),
            ),
            duration: const Duration(milliseconds: 200),
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
              promoCode.reason!,
              style: const TextStyle(fontFamily: "BigVesta"),
            ),
            duration: const Duration(milliseconds:60 ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            elevation: 10,
            onVisible: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) {
               return OrderSure(pro:promoCode);
              //  return const Text("data");
              }));
            },
          ));
      }
    });

  }
}
