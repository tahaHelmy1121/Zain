import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shop/router.dart';
import 'core/localization/changelocaliziation.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: TranslationController(),
      locale: controller.language,
        getPages: routes,
    //  home: ProfileShow(),
      theme:ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        fontFamily: "OPTIBodoni"
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
