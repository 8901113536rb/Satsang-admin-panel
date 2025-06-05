import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:msgadminpanel/satsang/satsang_view.dart';
import 'package:msgadminpanel/splash_screen_view.dart';
import 'package:msgadminpanel/utils/colors.dart';
import 'package:msgadminpanel/utils/strings.dart';
import 'package:sizer/sizer.dart';

import 'bhajan/bhajan_view.dart';
import 'category_bhajan/category_bhajan_view.dart';
import 'category_satsang/category_satsang_view.dart';
import 'home/home_view.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override

  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
            color: AppColor.whiteColor,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: true, fontFamily: Strings.fontFamily),
            home: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme:ThemeData(scaffoldBackgroundColor: AppColor.whiteColor, fontFamily: Strings.fontFamily),
              home:const HomeView(),
            )
        );
      },
    );
  }
}