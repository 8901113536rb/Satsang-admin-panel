import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msgadminpanel/satsang/satsang_view.dart';
import 'package:msgadminpanel/utils/colors.dart';
import 'package:msgadminpanel/utils/imageurls.dart';
import 'package:msgadminpanel/utils/strings.dart';
import 'package:sizer/sizer.dart';
import 'common_views/image_view.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Timer(const Duration(seconds: 3), () => Get.offAll(const SatsangView()));
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: AppColor.themeColor,
      child:  SafeArea(
          child: Scaffold(
           body:  body(),
      )),
    );
  }
  body() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Strings.imageBaseurl + ImageUrls.screenBgImage),
          fit: BoxFit.fill,
        ),
      ),
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Center(
            child: ImageView(
              imageType: "png",
              imageUrl: ImageUrls.appLogoImage,
              height: 40.w,
              width: 40.w,
              boxFit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }

}
