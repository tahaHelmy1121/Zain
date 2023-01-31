import 'dart:async';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/view/screen/chat/screen/chatdetails.dart';
import '../../customdrawer.dart';


class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  int current = 1;

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String val = "";
  int xdCustomer = 0;

  getCustomerId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      xdCustomer = sharedPreferences.getInt('customerId')!;
    });
  }

  late Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timers) {
      if (timers.isActive) {
        setState(() {
          ChatDetails(
            changed: 1,
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var hightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      endDrawer: Custom(),
      appBar: AppBar(
        // flexibleSpace: MyAppBar(),
        elevation: 0,
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: const Text(
          "اتصل بنا",
        ),
        toolbarHeight: 55,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/chat.jpg")
              )
            ),
          ),
          Container(

            height: hightScreen*0.7,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(

                    height: hightScreen*0.6,
                    margin: const EdgeInsets.only(top: 7),
                    child: ChatDetails(changed: 1,),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: double.infinity,
                    child: Form(
                      key: globalKey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(3),
                            width: 250,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "ادخل رسالة!! ";
                                }
                                setState(() {
                                  val = value;
                                });
                                return null;
                              },
                              style: const TextStyle(
                                  fontFamily: "BigVesta",
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400),
                              textDirection: TextDirection.rtl,
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                errorStyle: const TextStyle(fontFamily: "BigVesta"),
                                hintText: "اكتب رسالتك",
                                hintStyle: const TextStyle(
                                    fontFamily: "BigVesta",
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400),
                                border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40)
                                ),
                                filled: true,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(EvaIcons.imageOutline),
                              ),
                              AvatarGlow(
                                glowColor: Colors.orangeAccent,
                                endRadius: 25.0,
                                child: IconButton(
                                  onPressed: () async {},
                                  icon: const Icon(EvaIcons.messageCircleOutline),
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
