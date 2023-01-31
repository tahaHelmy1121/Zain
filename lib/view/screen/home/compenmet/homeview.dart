import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/core/constant/style.dart';
import 'package:shop/view/screen/home/home.dart';

import '../../../settings.dart';
import '../../cart/cart.dart';
import '../../chat/chat.dart';
import '../../productdetails/products.dart';

class HomeView extends StatefulWidget {
  final int id  ;
   const HomeView({Key? key, required this.id}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool cases = true;
  int xdCustomer = 0;
  var connectivityResult = (Connectivity().checkConnectivity());

  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  getCustomerId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      xdCustomer = sharedPreferences.getInt('customerId')!;
    });
  }
  @override
  void initState() {
    getCustomerId();
    check().then((internet) {
      if (internet == null || internet == false) {
        setState(() {
          cases = false;
        });
      }
    });
    super.initState();
  }

  int current = 1;
  int currentTab = 0;
  final List<Widget> _scrren = [
    Home(
      id: 0,
    ),
    Cart(),
    Products(),
    Settings(),
  ];
  final PageStorageBucket backet = PageStorageBucket();
  Widget currentScreen = Home(id: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Text("Zain",style:Style.style2,),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = Home(id: 0);
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? Colors.teal : Colors.grey,
                        ),
                        Text(
                          "home",
                          style: TextStyle(
                              color:
                              currentTab == 0 ? Colors.teal : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = Cart();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.card_travel_rounded,
                          color: currentTab == 1 ? Colors.teal : Colors.grey,
                        ),
                        Text(
                          "cart",
                          style: TextStyle(
                              color:
                              currentTab == 1 ? Colors.teal : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = Products();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Icon(
                            Icons.plagiarism_rounded,
                            color: currentTab == 3 ? Colors.teal : Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            "products",
                            style: TextStyle(
                                color:
                                currentTab == 3 ? Colors.teal : Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = Chat();
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat,
                          color: currentTab == 4 ? Colors.teal : Colors.grey,
                        ),
                        Text(
                          "chat",
                          style: TextStyle(
                              color:
                              currentTab == 4 ? Colors.teal : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ]
    )
        )
    ),

      body:cases==true? PageStorage(
        child: currentScreen,
        bucket: backet,
      ): Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 550,
        child: Lottie.asset("assets/lotti/wifi.json"),
      ),
    );
  }
}
