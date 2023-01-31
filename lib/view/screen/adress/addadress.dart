import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/view/screen/adress/showaddress.dart';

import '../../../core/datasourse/dynamic/address/addaddress.dart';
import '../../../core/datasourse/dynamic/address/cityaddress.dart';
import '../../../core/datasourse/dynamic/address/countryaddress.dart';
import '../../../model/adress/addaddresmodel.dart';
import '../../../model/adress/city.dart';
import '../../../model/adress/country.dart';
import '../../../model/cart/promocode.dart';
import '../../../model/cart/skipmodel.dart';
import '../order/ordersure.dart';

class AddAddress extends StatefulWidget {
  final int? cartStep;

  final PromoCodeModel? pro;
  final int? noPromo;

  final SkipMode? sx;

  AddAddress({Key? key, this.cartStep, this.pro, this.noPromo, this.sx})
      : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  int xdCustomer = 0;
  late int countrySelected = 1;
  int? citySelected;
  bool checked = false;
  int checkValue = 0;
  TextEditingController adrscontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  GlobalKey<FormState> addressKey = GlobalKey<FormState>();

  getCustomerId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      xdCustomer = sharedPreferences.getInt('customerId')!;
    });
  }

  @override
  void dispose() {
    namecontroller.dispose();
    adrscontroller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomerId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("اضافة عنوان جديد"),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: addressKey,
          child: Column(
            children: [
              drewimage(),
              const SizedBox(
                height: 12,
              ),
              drewnameformfield(),
              drewaddressformfield(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [drewfetchcity(), drewfetchcountry()],
              ),
              drewButtonAddAddress(),
            ],
          ),
        ),
      ),
    );
  }

  Widget drewimage() {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      width: 350,
      height: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          image: const DecorationImage(
              image: AssetImage(
                  "assets/image/billing_address_and_shipping_address_c9f36ec77d.jpg"))),
    );
  }

  Widget drewnameformfield() {
    return Container(
      width: 350,
      height: 100,
      child: TextFormField(
        style: const TextStyle(
            fontFamily: "BigVesta",
            fontSize: 14.0,
            color: Color(0xff16222A),
            fontWeight: FontWeight.w400),
        textDirection: TextDirection.rtl,
        controller: namecontroller,
        validator: (value) {
          if (value!.isEmpty) {
            return " الاسم الاول ";
          }
          return null;
        },
        keyboardType: TextInputType.text,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontFamily: "BigVesta"),
          hintText: "ادخل الاسم الاول",
          hintStyle: const TextStyle(
              fontFamily: "BigVesta",
              fontSize: 15.0,
              color: Color(0xff16222A),
              fontWeight: FontWeight.w400),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
          filled: true,
        ),
      ),
    );
  }

  Widget drewaddressformfield() {
    return Container(
      width: 350,
      height: 100,
      child: TextFormField(
        style: const TextStyle(
            fontFamily: "BigVesta",
            fontSize: 14.0,
            color: Color(0xff16222A),
            fontWeight: FontWeight.w400),
        textDirection: TextDirection.rtl,
        controller: adrscontroller,
        validator: (value) {
          if (value!.isEmpty) {
            return "العنوان الاول ";
          }
          return null;
        },
        keyboardType: TextInputType.text,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontFamily: "BigVesta"),
          hintText: "ادخل العنوان",
          hintStyle: const TextStyle(
              fontFamily: "BigVesta",
              fontSize: 15.0,
              color: Color(0xff16222A),
              fontWeight: FontWeight.w400),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
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

  Widget drewButtonAddAddress() {
   return Container(
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
            AddAddressModel addAddresses = AddAddressModel();
            String nameAdd = namecontroller.text;
            String addDes = adrscontroller.text;
            await AddNewAddress.addAddress(
                customerId: xdCustomer,
                firstName: nameAdd,
                address1: addDes,
                countryId: countrySelected,
                regionId: citySelected,
                isDefault: checkValue)
                .then((value) {
              addAddresses = value;
            });

            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(
                  addAddresses.reason!,
                  style: TextStyle(fontFamily: "BigVesta"),
                ),
                duration: Duration(milliseconds: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                elevation: 10,
                onVisible: () {
                  if(widget.cartStep==0||widget.cartStep==null){
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) {
                          return ShowAddress();
                        }), (route) => false);
                  }
                  else{
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) {
                          return OrderSure(pro:widget.pro,recentAdded: 1,skip: widget.sx,);
                        }), (route) => false);

                  }

                },
              ));
          }
        },
        radius: 1,
        child: Center(
          child: Text(
            "اضافة عنوان",
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
