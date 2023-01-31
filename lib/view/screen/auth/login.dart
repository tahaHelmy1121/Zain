
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shop/core/constant/style.dart';
import 'package:shop/view/screen/auth/regestier.dart';
import '../../../contoller/auth/login.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/alertexitapp.dart';
import '../../../core/function/validinput.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/logoauth.dart';
import '../../widget/auth/textsignup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var devies = MediaQuery.of(context).size;
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      AppColor.grey,
                      AppColor.thirdColor,
                    ]
                )
            ),
          ),
          title: Text(
            "Zain",style: Style.style1,
          ),
          centerTitle: true,
          //  backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,

        ),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<LoginControllerImp>(
              builder: (controller) =>
                  Container(
                    padding:
                    const EdgeInsets.symmetric( horizontal: 4),
                    child: Form(
                      key: controller.globalKey,
                      child: ListView(children: [
                        const LogoAuth(),
                        Container(
                          height:devies.height*0.4 ,
                          width: devies.width*0.6,
                          child:Lottie.asset("assets/lotti/log.json"),
                        ),
                        SizedBox(height: 8,),
                        CustomTextBodyAuth(text: "انشاء حساب من خلال البريد وكلمة المرور او من خلال وسائل التواصل الاجتماعيانشاء حساب من خلال البريد وكلمة المرور او من خلال وسائل التواصل الاجتماعي"),
                        const SizedBox(height: 20),
                        CustomTextFormAuth(
                          isNumber: false,

                          valid: (val) {
                            return validInput(val!, 5, 100, "username");
                          },
                          mycontroller: controller.userEditingController,
                          hinttext: "ادخل البريد الالكتروني",
                          iconData: Icons.email_outlined,
                          labeltext: "لبريد الالكتروني",
                          // mycontroller: ,
                        ),


                        GetBuilder<LoginControllerImp>(
                          builder: (controller) => CustomTextFormAuth(
                            obscureText: controller.isshowpassword,
                            onTapIcon: () {
                              controller.showPassword();
                            },
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 3, 30, "password");
                            },
                            mycontroller: controller.passEditingController,
                            hinttext: "ادخل كلمة المرور",
                            iconData: Icons.lock_outline,
                            labeltext: "كلمة المرور",
                            // mycontroller: ,
                          ),
                        ),

                        CustomButtomAuth(
                            text: "Zain",
                            onPressed: () {
                              controller.login(context);
                            }),
                        const SizedBox(height: 40),
                        CustomTextSignUpOrSignIn(
                          textone: "هل تود انشاء حساب",
                          texttwo: " لديك حساب ? ",
                          onTap: () {
                               Get.off(Regestier());
                          },
                        )
                      ]),
                    ),
                  )),
        )

    );
  }
}
