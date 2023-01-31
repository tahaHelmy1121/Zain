import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/view/screen/home/home.dart';

import '../../core/datasourse/dynamic/auth/regestier.dart';
import '../../model/auth/register.dart';
import '../../view/screen/home/compenmet/homeview.dart';

abstract class Regestier extends GetxController {
  regstier(BuildContext context);
}

class RegestierImp extends Regestier {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();
  TextEditingController userEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController passEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    firstNameEditingController.dispose();
    lastNameEditingController.dispose();
    userEditingController.dispose();
    emailEditingController.dispose();
    phoneEditingController.dispose();
    passEditingController.dispose();
  }

  setCustomerId(int index) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setInt('customerId', index);
  }

  @override
  regstier(BuildContext context) async {
    if (globalKey.currentState!.validate()) {
      String firstName = firstNameEditingController.text;
      String lastName = lastNameEditingController.text;
      String userName = userEditingController.text;
      String emailAddress = emailEditingController.text;
      String phone = phoneEditingController.text;
      String password = passEditingController.text;
      List<RegisterModel> data = await RegestierData.registerCustomer(
        firstName: firstName,
        lastName: lastName,
        userName: userName,
        emailAddress: emailAddress,
        phone: phone,
        password: password,
        device: "x",
      );
      if (data[0].customerId != null) {
        setCustomerId(data[0].customerId!);
      }
      if (data[0].status == 1) {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text(
              data[0].reason!,
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
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) {
                return HomeView(id: 0,);
              }), (route) => false);
            },
          ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          content: Text(
            data[0].reason!,
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
