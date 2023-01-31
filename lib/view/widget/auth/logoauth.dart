
import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {

  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var devies = MediaQuery.of(context).size;
    return ClipOval(
      child: Container(
        height:devies.height*0.3 ,
        width: devies.width*0.6,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage("assets/image/Logo3.png")
          )
        ),
      )
    );
  }
}
