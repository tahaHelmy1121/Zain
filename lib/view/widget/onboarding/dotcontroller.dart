
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../contoller/onbordingcontrooler.dart';
import '../../../core/constant/color.dart';
import '../../../core/datasourse/static/onbordingdata.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 8),
                          duration: const Duration(milliseconds: 900),
                          width: controller.currentPage == index ? 20 : 5,
                          height: 6,
                          decoration: BoxDecoration(
                              color:Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            ));
  }
}
