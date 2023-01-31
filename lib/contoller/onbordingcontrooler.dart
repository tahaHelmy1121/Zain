
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop/view/screen/auth/login.dart';

import '../core/datasourse/static/onbordingdata.dart';
import '../core/services/services.dart';
import '../routes.dart';


abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {

  late PageController pageController;

  int currentPage = 0;

  MyServices myServices = Get.find() ;

  @override
  next() {
    currentPage++;

    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("step", "1") ;
      Get.offAll(Login()) ;
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
