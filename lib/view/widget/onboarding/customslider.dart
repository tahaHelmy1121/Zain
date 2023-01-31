
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../contoller/onbordingcontrooler.dart';
import '../../../core/constant/color.dart';
import '../../../core/datasourse/static/onbordingdata.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => SingleChildScrollView(
          child: Column(
                children: [
                  Text(onBoardingList[i].title!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          fontFamily: "BigVesta",
                          letterSpacing: 3,
                          color: AppColor.black)),
                    Container(
          height:250,
       width: 350,
              decoration: BoxDecoration(
       image: DecorationImage(
           image: ExactAssetImage(onBoardingList[i].image!),
       )
          )
                  ),
                  const SizedBox(height: 2),

                  const SizedBox(height: 5),
                  Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        onBoardingList[i].body!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            height: 2,
                            color: AppColor.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )),
                ],
              ),
        ));
  }
}
