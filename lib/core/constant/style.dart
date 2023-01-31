

    import 'package:flutter/cupertino.dart';

import 'color.dart';




 abstract  class Style {


   static TextStyle style1 = const TextStyle(
       fontSize: 22,
       fontWeight: FontWeight.bold,
       letterSpacing: 3,
       color: AppColor.grey
   );
   static TextStyle style2 = const TextStyle(
       fontSize: 14,
       fontWeight: FontWeight.bold,
       letterSpacing: 3,
       color: AppColor.black
   );


 }