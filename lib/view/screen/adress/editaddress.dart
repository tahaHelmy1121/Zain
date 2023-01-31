import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/core/datasourse/dynamic/address/countryaddress.dart';
import 'package:shop/view/screen/adress/showaddress.dart';

import '../../../core/datasourse/dynamic/address/cityaddress.dart';
import '../../../core/datasourse/dynamic/address/updateaddress.dart';
import '../../../model/adress/city.dart';
import '../../../model/adress/country.dart';
import '../../../model/adress/editaddress.dart';
import '../../../model/adress/editmodel.dart';



class EditAddress extends StatefulWidget {
  final EditAddressUser? getEdit;

  EditAddress({
     this.getEdit,
  });

  @override
  _EditAddressState createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  GlobalKey<FormState> addressKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController des = TextEditingController();
  String firstEditValue="";
  String addressEditValue="";

  int countrySelected = 1;
  int? citySelected;

  int xdCustomer = 0;
  String nameEdit ="";
  String desEdit="";
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
  //  countrySelected = widget.getEdit!.countryId!;
  //  citySelected = widget.getEdit!.regionId;
  //  firstEditValue=widget.getEdit!.addressFirstName!;
  //  addressEditValue=widget.getEdit!.addressAddress1!;
  }

  List<CityModel> cityData = [];
  bool checked =false;
  int checkValue =0;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: addressKey,
      child: Column(
        children: [
          nameformfield(),
           SizedBox(
            height: 18,
          ),
          addressfiled(),
          const SizedBox(
            height: 18,
          ),
       Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                drewfetchcity(),
                drewfetchcountry()
              ],
            ),

          Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20),
            child: StatefulBuilder(builder: (context,StateSetter set){
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Checkbox(
                    value: checked,
                    onChanged: (bool? val) {
                      set(() {
                        checked=!checked;
                        checkValue=1;
                      });
                    },
                  ),
                  const Text(
                    "العنوان الرئيسي",
                    style: TextStyle(
                      fontFamily: "BigVesta",
                      fontSize: 14.0,
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              );
            }),
          ),
          drewbutton(),
        ],
      ),
    );
  }

  Widget nameformfield() {
    return Container(
      width: 250,
      height: 80,
      child: TextFormField(
        initialValue: firstEditValue,
        style: TextStyle(

            fontFamily: "BigVesta",
            fontSize: 14.0,
            color: Color(0xff16222A),
            fontWeight: FontWeight.w400),
        textDirection: TextDirection.rtl,
        validator: (value) {
          if (value!.isEmpty) {
            return "تعديل الاسم الاول ";
          }
          firstEditValue = value;
          return null;
        },
        keyboardType: TextInputType.text,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          //
          errorStyle: TextStyle(fontFamily: "BigVesta"),
          hintText: "تعديل الاسم الاول",
          hintStyle: TextStyle(
              fontFamily: "BigVesta",
              fontSize: 14.0,
              color: Color(0xff16222A),
              fontWeight: FontWeight.w400),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          filled: true,
        ),
      ),
    );
  }
  Widget addressfiled(){
  return  Container(
    width: 350,
    height: 120,
    child: TextFormField(
        initialValue:addressEditValue,
        style: const TextStyle(
            fontFamily: "BigVesta",
            fontSize: 14.0,
            color: Color(0xff16222A),
            fontWeight: FontWeight.w400),
        textDirection: TextDirection.rtl,
        validator: (value) {
          if (value!.isEmpty) {
            return "تعديل العنوان ";
          }
          addressEditValue=value;
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.right,
        decoration:  InputDecoration(
          errorStyle: TextStyle(fontFamily: "BigVesta"),
          hintText: "تعديل العنوان",
          hintStyle: TextStyle(
              fontFamily: "BigVesta",
              fontSize: 14.0,
              color: Color(0xff16222A),
              fontWeight: FontWeight.w400),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40)
          ),
          filled: true,
        ),
      ),
  );


  }
  Widget drewfetchcity() {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(left: 20),
      height: 120,
      width: 180,
      child: FutureBuilder(
          future: CityData.fetchCity(countrySelected),
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
                  List<CityModel> cityData = snapshot.data;
                  if (cityData.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Center(
                        child: Text(
                          " لايوجد مدن متاحة",
                          style: TextStyle(
                              fontFamily: "BigVesta",
                              fontSize: 14.0,
                              color: Color(0xff16222A),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    );
                  } else {
                    citySelected = cityData.first.id!;
                    return DropdownButtonFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              gapPadding: 1.4,
                              borderRadius: BorderRadius.circular(40))),
                      validator: (value) =>
                      value == null ? 'مطلوب اختيار مدينة' : null,
                      iconEnabledColor: Colors.orangeAccent,
                      value: citySelected,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: cityData.map((var items) {
                        return DropdownMenuItem(
                            value: items.id,
                            child: Text(
                              items.name.toString(),
                              style: const TextStyle(
                                  fontFamily: "BigVesta",
                                  fontSize: 10.0,
                                  color: Color(0xff16222A),
                                  fontWeight: FontWeight.w400),
                            ));
                      }).toList(),
                      onChanged: (var newVal) {
                        citySelected = newVal;
                      },
                    );
                  }
                }
            }
          }),
    );
  }
  Widget drewfetchcountry() {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(left: 5),
      height: 120,
      width: 180,
      child: FutureBuilder(
          future: CountryData.fetchCountry(),
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
                  List<CountryModel> cityData = snapshot.data;
                  if (cityData.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Center(
                        child: Text(
                          " لايوجد مدن متاحة",
                          style: TextStyle(
                              fontFamily: "BigVesta",
                              fontSize: 14.0,
                              color: Color(0xff16222A),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    );
                  } else {
                    List<CountryModel> countryData = snapshot.data;
                    return DropdownButtonFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              gapPadding: 1.4,
                              borderRadius: BorderRadius.circular(40))),
                      validator: (value) =>
                      value == null ? 'مطلوب اختيار دولة' : null,
                      iconEnabledColor: Colors.orangeAccent,
                      value: countrySelected,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: countryData.map((var items) {
                        return DropdownMenuItem(
                            value: items.id,
                            child: Text(
                              items.addressFormat.toString(),
                              style: const TextStyle(
                                  fontFamily: "BigVesta",
                                  fontSize: 10.0,
                                  color: Color(0xff16222A),
                                  fontWeight: FontWeight.w400),
                            ));
                      }).toList(),
                      onChanged: (newVal) {
                        countrySelected != newVal;
                      },
                    );
                  }
                }
            }
          }),
    );
  }
  Widget drewbutton(){
    return  Container(
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
        onTap: () async {
          if (addressKey.currentState!.validate()) {
            EditModel editModel = EditModel();
            await UpdateAddress.editAddress(
                id: widget.getEdit!.id,
                customerId: xdCustomer,
                firstName: firstEditValue,
                address1: addressEditValue,
                countryId: countrySelected,
                regionId: citySelected,
                isDefault: checkValue)
                .then((value) {
              editModel = value;
            });
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(
                  editModel.reason!,
                  style: const TextStyle(fontFamily: "BigVesta"),
                ),
                duration: const Duration(milliseconds: 35),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                elevation: 10,
                onVisible: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                        return  ShowAddress();
                      }), (route) => false);
                },
              ));
          }
        },
        radius: 1,
        child: const Center(
          child: Text(
            "تعديل العنوان",
            style: TextStyle(
                fontSize: 18.0,
                fontFamily: "BigVesta",
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
