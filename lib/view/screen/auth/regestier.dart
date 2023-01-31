import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shop/core/constant/style.dart';
import '../../../contoller/auth/login.dart';
import '../../../contoller/auth/regestier.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/alertexitapp.dart';
import '../../../core/function/validinput.dart';
import '../../widget/auth/custombuttonauth.dart';

import '../../widget/auth/textsignup.dart';
import 'login.dart';

class Regestier extends StatelessWidget {
   Regestier({Key? key}) : super(key: key);
  var x = '';


  @override
  Widget build(BuildContext context) {
    var devies = MediaQuery.of(context).size;
    Get.put(RegestierImp());
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              AppColor.grey,
              AppColor.thirdColor,
            ])),
          ),
          title: Text(
            "Zain",
            style: Style.style1,
          ),
          centerTitle: true,
          //  backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
        ),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<RegestierImp>(
              builder: (controller) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Form(
                  key: controller.globalKey,
                  child: ListView(children: [
                    //    const LogoAuth(),
                    Container(
                      height: devies.height * 0.4,
                      width: devies.width * 0.6,
                      child: Lottie.asset("assets/lotti/waze.json"),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    //   CustomTextBodyAuth(text: "انشاء حساب من خلال البريد وكلمة المرور او من خلال وسائل التواصل الاجتماعيانشاء حساب من خلال البريد وكلمة المرور او من خلال وسائل التواصل الاجتماعي"),
                    const SizedBox(height: 20),
                    TextFormField(
                      style: const TextStyle(
                          fontFamily: "BigVesta",
                          fontSize: 14.0,
                          color: Color(0xff16222A),
                          fontWeight: FontWeight.w400),
                      textDirection: TextDirection.rtl,
                      controller: controller.firstNameEditingController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "أدخل الاسم الاول ";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        errorStyle: const TextStyle(fontFamily: "BigVesta"),
                        hintText: "الاسم الاول",
                        hintStyle: const TextStyle(
                            fontFamily: "BigVesta",
                            fontSize: 14.0,
                            color: Color(0xff16222A),
                            fontWeight: FontWeight.w400),
                        border:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 12,),
                    TextFormField(
                      style: const TextStyle(
                          fontFamily: "BigVesta",
                          fontSize: 14.0,
                          color: Color(0xff16222A),
                          fontWeight: FontWeight.w400),
                      textDirection: TextDirection.rtl,
                      controller: controller.lastNameEditingController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "أدخل الاسم الاخير ";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        errorStyle: const TextStyle(fontFamily: "BigVesta"),
                        hintText: "الاسم الاخير",
                        hintStyle: const TextStyle(
                            fontFamily: "BigVesta",
                            fontSize: 14.0,
                            color: Color(0xff16222A),
                            fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 12,),
                    TextFormField(
                      style: const TextStyle(
                          fontFamily: "BigVesta",
                          fontSize: 14.0,
                          color: Color(0xff16222A),
                          fontWeight: FontWeight.w400),
                      textDirection: TextDirection.rtl,
                      controller: controller.userEditingController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "أدخل اسم المستخدم ";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        errorStyle: const TextStyle(fontFamily: "BigVesta"),
                        hintText: "إسم المستخدم",
                        hintStyle: const TextStyle(
                            fontFamily: "BigVesta",
                            fontSize: 14.0,
                            color: Color(0xff16222A),
                            fontWeight: FontWeight.w400),
                        border:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 12,),
                    TextFormField(
                      style: const TextStyle(
                          fontFamily: "BigVesta",
                          fontSize: 14.0,
                          color: Color(0xff16222A),
                          fontWeight: FontWeight.w400),
                      controller: controller.emailEditingController,
                      textDirection: TextDirection.rtl,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "أدخل البريد الإلكتروني ";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        errorStyle: const TextStyle(fontFamily: "BigVesta"),
                        hintText: "البريد الإلكتروني",
                        hintStyle: const TextStyle(
                            fontFamily: "BigVesta",
                            fontSize: 14.0,
                            color: Color(0xff16222A),
                            fontWeight: FontWeight.w400),
                        border:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 12,),
                    TextFormField(
                      style: const TextStyle(
                          fontFamily: "BigVesta",
                          fontSize: 14.0,
                          color: Color(0xff16222A),
                          fontWeight: FontWeight.w400),
                      controller: controller.phoneEditingController,
                      textDirection: TextDirection.rtl,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "أدخل رقم الهاتف";
                        }
                        return null;
                      },
                      textAlign: TextAlign.right,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        errorStyle: const TextStyle(fontFamily: "BigVesta"),
                        hintText: "رقم الهاتف",
                        hintStyle: const TextStyle(
                            fontFamily: "BigVesta",
                            fontSize: 14.0,
                            color: Color(0xff16222A),
                            fontWeight: FontWeight.w400),
                        border:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 12,),
                    TextFormField(
                      style: const TextStyle(
                          fontFamily: "BigVesta",
                          fontSize: 14.0,
                          color: Color(0xff16222A),
                          fontWeight: FontWeight.w400),
                      controller: controller.passEditingController,
                      textDirection: TextDirection.rtl,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "أدخل كلمة المرور ";
                        }
                        return null;
                      },
                      textAlign: TextAlign.right,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        errorStyle: const TextStyle(fontFamily: "BigVesta"),
                        hintText: "كلمة المرور",
                        hintStyle: const TextStyle(
                            fontFamily: "BigVesta",
                            fontSize: 14.0,
                            color: Color(0xff16222A),
                            fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        filled: true,
                      ),
                    ),
                    CustomButtomAuth(
                        text: "Zain",
                        onPressed: () {
                          controller.regstier(context);
                        }),
                    const SizedBox(height: 40),
                    CustomTextSignUpOrSignIn(
                      textone: "هل تود انشاء حساب",
                      texttwo: " لديك حساب ? ",
                      onTap: () {
                        Get.off(const Login());
                      },
                    )
                  ]),
                ),
              )),
        ));
  }
}
