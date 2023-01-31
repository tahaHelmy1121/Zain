import 'package:avatar_glow/avatar_glow.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/datasourse/dynamic/address/editadress.dart';
import '../../../core/datasourse/dynamic/address/removeaddress.dart';
import '../../../core/datasourse/dynamic/address/show.dart';
import '../../../model/adress/editaddress.dart';
import '../../../model/adress/removeaddress.dart';
import '../../../model/adress/showaddress.dart';
import '../../customdrawer.dart';
import '../../widget/custom/customappbar.dart';
import 'addadress.dart';
import 'editaddrescreen.dart';


class ShowAddress extends StatefulWidget {
  @override
  _ShowAddressState createState() => _ShowAddressState();
}

class _ShowAddressState extends State<ShowAddress> {
  int xdCustomer = 0;

  getCustomerId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      xdCustomer = sharedPreferences.getInt('customerId')!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomerId();
  }

  int current = 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddAddress();
          }));
        },
        child: AvatarGlow(
          glowColor: Colors.orangeAccent,
          endRadius: 60.0,
          child: Icon(Icons.add_location_alt_outlined),
        ),
      ),
      endDrawer: Custom(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: MyAppBar(),
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "العناوين",
        ),
        toolbarHeight: 55,
      ),
      body: FutureBuilder(
          future: ShowAddressData.showAddress(xdCustomer),
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.active:
              case ConnectionState.none:
                return Text("");
              default:
                if (snapshot.hasError) {
                  return Text("");
                } else {
                  List<ShowAddressModel> data = snapshot.data;
                  if (data.isEmpty) {
                    return Center(
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/image/Address-bro.png")
                          )
                        ),
                      )
                    );
                  } else {
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, position) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40)
                            ),
                            height: 300,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Card(
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                                ),
                                elevation: 5,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          width: 40,
                                          child: IconButton(
                                              onPressed: () {
                                                RemoveModel removeModel =
                                                RemoveModel();
                                                AwesomeDialog(
                                                    btnOkColor: Colors.red,
                                                    btnOkOnPress: () async {
                                                      RemoveAddress
                                                          .removeAddressById(
                                                          data[position]
                                                              .id!)
                                                          .then((value) {
                                                        removeModel = value;
                                                      });
                                                      setState(() {

                                                      });
                                                    },
                                                    btnOkText: "حذف",
                                                    context: context,
                                                    width: double.infinity,
                                                    dismissOnTouchOutside:
                                                    false,
                                                    buttonsBorderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(
                                                            20)),
                                                    animType:
                                                    AnimType.LEFTSLIDE,
                                                    dialogType:
                                                    DialogType.ERROR,
                                                    buttonsTextStyle: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "BigVesta",
                                                    ),
                                                    body: Text(
                                                      "هل تريد حذف العنوان ؟",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: "BigVesta",
                                                      ),
                                                    ),
                                                    btnCancelColor:
                                                    Colors.black38,
                                                    btnCancelText: "إلغاء",
                                                    btnCancelOnPress: () {})
                                                  .show();
                                              },
                                              icon: Image.asset(
                                                "assets/image/icons8-delete-48.png",
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          width: 40,
                                          child: IconButton(
                                            onPressed: () async {
                                              EditAddressUser editShowAddress =
                                              EditAddressUser();
                                              await EditAddress.showAddress(
                                                  data[position].id!)
                                                  .then((value) {
                                                editShowAddress = value;
                                              });
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                        return EditView(
                                                          getEditAddress:
                                                          editShowAddress,
                                                        );
                                                      }));
                                            },
                                            icon: Image.asset(
                                              "assets/image/icons8-edit-property-48.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.all(5),
                                            width: 150,
                                            child: Text(
                                              data[position]
                                                  .addressAddress1
                                                  .toString(),
                                              maxLines: 1,
                                              style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 16.0,
                                                fontFamily: "BigVesta",
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )),
                                        Container(
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.all(5),
                                            width: 120,
                                            child: Column(
                                              children: [
                                                Text(
                                                  data[position].mobile.toString(),
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    overflow: TextOverflow.ellipsis,
                                                    color: Colors.black,
                                                    fontSize: 12.0,
                                                    fontFamily: "BigVesta",
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  data[position].countryName.toString(),
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    overflow: TextOverflow.ellipsis,
                                                    color: Colors.black,
                                                    fontSize: 12.0,
                                                    fontFamily: "BigVesta",
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  data[position].regionName.toString(),
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    overflow: TextOverflow.ellipsis,
                                                    color: Colors.black,
                                                    fontSize: 12.0,
                                                    fontFamily: "BigVesta",
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                }
            }
          }),
    );
  }
}
