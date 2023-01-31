import 'dart:ui';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/view/screen/home/home.dart';

import '../../../core/datasourse/dynamic/profile/profiledata.dart';
import '../../../model/profile/profile.dart';
import '../../../model/profile/updateprofile.dart';
import '../../customdrawer.dart';
import '../home/compenmet/homeview.dart';

class ProfileShow extends StatefulWidget {
  @override
  _ProfileShowState createState() => _ProfileShowState();
}

class _ProfileShowState extends State<ProfileShow> {
  int xdCustomer = 0;

  getCustomerId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      xdCustomer = sharedPreferences.getInt('customerId')!;
    });
  }

  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();
  TextEditingController userEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController passEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    firstNameEditingController.dispose();
    lastNameEditingController.dispose();
    userEditingController.dispose();
    emailEditingController.dispose();
    phoneEditingController.dispose();
    passEditingController.dispose();
  }

  @override
  void initState() {
    super.initState();
    getCustomerId();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> globalKey = GlobalKey<FormState>();
    return Scaffold(
      endDrawer: Custom(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          bottomOpacity: 2,
          toolbarHeight: 150,
          elevation: 0,
          backgroundColor: Colors.grey.shade100,
          flexibleSpace: Container(
            height: 350,
              width: 350,
              decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage("assets/image/Overwhelmed-bro.png"),
            ),
          )),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            alignment: Alignment.topRight,
            child: Column(
              textDirection: TextDirection.rtl,
              children: [
                Container(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "حسابي ",
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 22.0, fontFamily: "BigVesta"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, bottom: 3),
                  child: Container(
                    height: 70,
                    width: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage("assets/image/Logo3.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          FutureBuilder(
              future: ProfileData.profileCustomer(customerId: xdCustomer),
              builder: (context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.active:
                  case ConnectionState.none:
                    return const Text("");
                  default:
                    if (snapshot.hasError) {
                      return const Text("");
                    } else {
                      List<ProfileModel> data = snapshot.data;
                      print(data.length.toString());
                      if (data.isEmpty) {
                        return const Text("البيانات غير متاح الان ");
                      } else {
                        return Form(
                          key: globalKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 20.0, left: 20),
                                child: TextFormField(
                                  style: TextStyle(
                                    fontSize: 10,
                                    letterSpacing: 3,
                                    color: Colors.green
                                  ),
                                  textDirection: TextDirection.ltr,
                                  controller: firstNameEditingController,
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    errorStyle:
                                        const TextStyle(fontFamily: "BigVesta"),
                                    label: Container(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        data[0].firstName,
                                        style: const TextStyle(
                                            fontFamily: "BigVesta",
                                            fontSize: 16.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.right,
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                    hintText: "الاسم الاول",
                                    hintStyle: const TextStyle(
                                        fontFamily: "BigVesta",
                                        fontSize: 14.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    filled: true,
                                    prefixIcon: const Icon(
                                      EvaIcons.personOutline,
                                      color: Colors.orangeAccent,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 20.0, left: 20),
                                child: TextFormField(
                                  textDirection: TextDirection.rtl,
                                  controller: lastNameEditingController,
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    errorStyle:
                                        const TextStyle(fontFamily: "BigVesta"),
                                    label: Container(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        data[0].lasName,
                                        style: const TextStyle(
                                            fontFamily: "BigVesta",
                                            fontSize: 16.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.right,
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                    hintText: "الاسم الاخير",
                                    hintStyle: const TextStyle(
                                        fontFamily: "BigVesta",
                                        fontSize: 14.0,
                                        color: Color(0xff16222A),
                                        fontWeight: FontWeight.w400),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    filled: true,
                                    prefixIcon: const Icon(
                                      EvaIcons.personOutline,
                                      color: Colors.orangeAccent,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 20.0, left: 20),
                                child: TextFormField(
                                  textDirection: TextDirection.rtl,
                                  controller: userEditingController,
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    errorStyle:
                                        const TextStyle(fontFamily: "BigVesta"),
                                    label: Container(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        data[0].userName,
                                        style: const TextStyle(
                                            fontFamily: "BigVesta",
                                            fontSize: 16.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.right,
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                    hintText: "إسم المستخدم",
                                    hintStyle: const TextStyle(
                                        fontFamily: "BigVesta",
                                        fontSize: 14.0,
                                        color: Color(0xff16222A),
                                        fontWeight: FontWeight.w400),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    filled: true,
                                    prefixIcon: const Icon(
                                      EvaIcons.personOutline,
                                      color: Colors.orangeAccent,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 20.0, left: 20),
                                child: TextFormField(
                                  controller: emailEditingController,
                                  textDirection: TextDirection.rtl,
                                  keyboardType: TextInputType.emailAddress,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    errorStyle:
                                        const TextStyle(fontFamily: "BigVesta"),
                                    label: Container(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        data[0].userEmail,
                                        style: const TextStyle(
                                            fontFamily: "BigVesta",
                                            fontSize: 16.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.right,
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                    hintText: "البريد الإلكتروني",
                                    hintStyle: const TextStyle(
                                        fontFamily: "BigVesta",
                                        fontSize: 14.0,
                                        color: Color(0xff16222A),
                                        fontWeight: FontWeight.w400),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    filled: true,
                                    prefixIcon: const Icon(
                                      EvaIcons.emailOutline,
                                      color: Colors.orangeAccent,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 20.0, left: 20),
                                child: TextFormField(
                                  controller: phoneEditingController,
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    errorStyle:
                                        const TextStyle(fontFamily: "BigVesta"),
                                    label: Container(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        data[0].phone,
                                        style: const TextStyle(
                                            fontFamily: "BigVesta",
                                            fontSize: 16.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.right,
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                    hintText: "رقم الهاتف",
                                    hintStyle: const TextStyle(
                                        fontFamily: "BigVesta",
                                        fontSize: 14.0,
                                        color: Color(0xff16222A),
                                        fontWeight: FontWeight.w400),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    filled: true,
                                    prefixIcon: const Icon(
                                      EvaIcons.phoneCallOutline,
                                      color: Colors.orangeAccent,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xff16222A),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                    topLeft: Radius.circular(25),
                                  ),
                                ),
                                width: 180,
                                height: 50,
                                child: InkWell(
                                    child: Center(
                                        child: Text(
                                      "حدث بيناتك",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14,letterSpacing: 4),
                                    )),
                                    onTap: () async {
                                      if (globalKey.currentState!.validate()) {
                                        String firstName =
                                            firstNameEditingController.text;
                                        String lastName =
                                            lastNameEditingController.text;
                                        String userName =
                                            userEditingController.text;
                                        String emailAddress =
                                            emailEditingController.text;
                                        String phone =
                                            phoneEditingController.text;
                                        List<UpdateProfile> data =
                                            await ProfileDataUpdate
                                                .profileUpdate(
                                          firstName: firstName,
                                          lastName: lastName,
                                          userName: userName,
                                          email: emailAddress,
                                          phone: phone,
                                          idCustomer: xdCustomer,
                                        );
                                        if (data[0].status == 1) {
                                          ScaffoldMessenger.of(context)
                                            ..removeCurrentSnackBar()
                                            ..showSnackBar(SnackBar(
                                              content: Text(
                                                data[0].reason!.replaceAll(
                                                    'updated',
                                                    'تم تحديث بيانتك بنجاح'),
                                                style: TextStyle(
                                                    fontFamily: "BigVesta"),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 35),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight: Radius.circular(15),
                                                ),
                                              ),
                                              elevation: 10,
                                              onVisible: () {
                                                Navigator.pushAndRemoveUntil(
                                                    context, MaterialPageRoute(
                                                        builder: (context) {
                                                  return HomeView(id: 0,
                                                  );
                                                }), (route) => false);
                                              },
                                            ));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                              ),
                                            ),
                                            content: Text(
                                              data[0].reason!,
                                              style: TextStyle(
                                                  fontFamily: "BigVesta"),
                                            ),
                                            elevation: 10,
                                            duration:
                                                const Duration(seconds: 1),
                                          ));
                                        }
                                      }
                                    }),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      }
                    }
                }
              })
        ])));
  }
}
