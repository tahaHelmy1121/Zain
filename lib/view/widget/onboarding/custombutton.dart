import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../contoller/onbordingcontrooler.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/style.dart';



class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.white, Colors.green.shade200]),
          borderRadius: BorderRadius.circular(40)),
      margin: const EdgeInsets.only(bottom: 30),
      height:70,
      width: 250,
      child: MaterialButton(
          padding: const EdgeInsets.symmetric(vertical: 0),
          textColor: AppColor.black,
          onPressed: () {
            controller.next();
          },
          //  color:Colors.grey,
          child:  Center(
            child: Text(
              "Zain",
              style:
              Style.style1,
            ),
          )),
    );
  }
}
