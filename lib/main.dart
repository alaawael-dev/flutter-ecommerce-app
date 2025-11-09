import 'package:ecommerce/core/consts/colors.dart';
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:ecommerce/core/localization/translation.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/routes.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:ecommerce/view/screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: ThemeData(
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            inherit: false,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColor.black,
            textBaseline: TextBaseline.alphabetic, 
          ),
          headlineMedium: TextStyle(
            inherit: false,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: AppColor.black,
            textBaseline: TextBaseline.alphabetic, 
          ),
          bodyLarge: TextStyle(
            inherit: false,
            height: 2,
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: AppColor.grey,
            textBaseline: TextBaseline.alphabetic, 
          ),

        ),
      ),
      home: Language(),
      routes: routes,
    );
  }
}
  