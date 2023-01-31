
  import 'package:flutter/material.dart';
   import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/view/screen/home/compenmet/homeview.dart';

import '../../core/datasourse/dynamic/auth/login.dart';
import '../../core/services/services.dart';
import '../../model/auth/loginmodel.dart';
import '../../view/screen/home/home.dart';
abstract  class LoginController extends GetxController{

login(BuildContext context);

}
class LoginControllerImp extends LoginController{
  bool isshowpassword = true;

  MyServices myServices = Get.find();


  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController userEditingController = TextEditingController();
  TextEditingController passEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userEditingController.dispose();
    passEditingController.dispose();
  }

  setCustomerId(int index) async {

    myServices.sharedPreferences.setInt('customerId', index);

  }

  @override
  login(BuildContext context)async {
    if (globalKey.currentState!.validate()) {
      String userName = userEditingController.text;
      var password = passEditingController.text;

      List<LoginModel> data =

      await LoginData.loginCustomer(
          userName, password, "x");
      if (data[0].userId != null) {

        setCustomerId(data[0].userId);
      }
      if (data[0].status == 1) {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text(
              data[0].reason,
              style: TextStyle(fontFamily: "BigVesta"),
            ),
            duration: Duration(milliseconds: 35),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            elevation: 10,
            onVisible: () {
              myServices.sharedPreferences.setString("step","2") ;
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) {
                    return HomeView(id: 0,);
                  }), (route) => false);
            },
          ));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          content: Text(
            data[0].reason,
            style: TextStyle(fontFamily: "BigVesta"),
          ),
          elevation: 10,
          duration: const Duration(seconds: 1),
        ));
      }
    } else {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          elevation: 10,
          duration: Duration(seconds: 1),
          content: Text(
            'حدث خطاء',
            style: TextStyle(fontFamily: "BigVesta"),
          ),
        ),
      );
    }

  }
  }



