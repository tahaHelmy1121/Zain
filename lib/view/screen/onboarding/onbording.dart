
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../contoller/onbordingcontrooler.dart';
import '../../../core/constant/color.dart';
import '../../widget/onboarding/custombutton.dart';
import '../../widget/onboarding/customslider.dart';
import '../../widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp()) ;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white, Colors.green.shade200
              ]
            )
          ),
        ),
      ),
       // backgroundColor: Colors.red.shade100,
        body: SafeArea(
            child: Column(children: [
               const Expanded(
               // flex: 2,
                child: CustomSliderOnBoarding(),
              ),
              Expanded(
                  child: Column(
                    children: const [
                      CustomDotControllerOnBoarding(),
                   SizedBox(height: 30,),
                      CustomButtonOnBoarding()
                    ],
                  ))
            ]),
          ),
      );
  }
}
