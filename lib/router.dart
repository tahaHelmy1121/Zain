import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/routes.dart';
import 'package:shop/view/screen/auth/login.dart';
import 'package:shop/view/screen/auth/regestier.dart';
import 'package:shop/view/screen/home/home.dart';
import 'package:shop/view/screen/onboarding/onbording.dart';
import 'package:shop/view/screen/splash/splachview.dart';

import 'core/middleware/mymiddleware.dart';


List<GetPage<dynamic>>? routes = [
  GetPage(  name: "/", page: () => const OnBoarding(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () => ProductDetails()),
//  Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.home, page: () =>  Home(id: 0,)),
  GetPage(name: AppRoute.regestier, page: () =>  Regestier()),
  GetPage(name: AppRoute.splash, page: () =>  SplashView()),

];


   