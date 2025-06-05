import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msgadminpanel/satsang/satsang_controller.dart';
import 'package:msgadminpanel/utils/sizes.dart';
import 'package:sizer/sizer.dart';
import '../common_views/search_textfield_view.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';
import '../utils/textstyles.dart';

class SatsangView extends StatefulWidget {
  const SatsangView({super.key});

  @override
  State<SatsangView> createState() => _SatsangViewState();
}

class _SatsangViewState extends State<SatsangView> {
  SatsangController controller = Get.put(SatsangController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: body(),
      ),
    );
  }

  body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appBarView(),
        height4,
        Padding(
          padding: EdgeInsets.only(left: 1.5.w, right: 1.5.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.satSangTitle,
                style: TextStyles().satsangTitleTextStyle,
              ),
              height2,
              SearchTextfieldView(
                  hint: Strings.enterSatSangTitle,
                  controller: controller.titleController,
                  prefixIcon: Icon(
                    Icons.title,
                    color: AppColor.blackColor,
                    size: 15,
                  )),
              height4,
              Text(
                Strings.satSangDate,
                style: TextStyles().satsangTitleTextStyle,
              ),
              height2,
              GestureDetector(
                onTap: (){
                  print("tap me -----");
                  controller.selectDate(context);
                },
                child:  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // color: AppColor.filterColor,
                        border: Border.all(color: AppColor.blackColor)),
                    height: 7.h,
                    padding: EdgeInsets.only(left: 1.w),
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          color: AppColor.blackColor,
                          size: 15,
                        ),
                        width1,
                        Text(
                          Strings.enterSatSangDate,
                          style: TextStyles().hintTextStyle,
                        ),
                      ],
                    ),
                )
              ),
              height4,
              Text(
                Strings.satSangVideo,
                style: TextStyles().satsangTitleTextStyle,
              ),
              height2,
              videoView(),
              height1,
              popularView(),
              height8,
              saveButtonView(),

            ],
          ),
        )
      ],
    );
  }

  appBarView() {
    return Center(
      child: Container(
        color: AppColor.profileBgColor.withOpacity(0.2),
        height: 10.h,
        width: double.infinity,
        alignment: Alignment.center,
        child:   Text(
          Strings.newSatSang,
          style: TextStyles().addSatsangVideoTextStyle,
        ),
      ),
    );
  }

  videoView() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: AppColor.filterColor,
          border: Border.all(color: AppColor.blackColor)),
      height: 15.h,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.download_rounded,
            size: 22,
          ),
          height05,
          Text(
            Strings.clickDropSatSangVideo,
            style: TextStyles().satsangTitleTextStyle,
          ),
        ],
      ),
    );
  }

  saveButtonView() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColor.themeColor,
          border: Border.all(color: AppColor.themeColor)),
      height: 6.h,
      alignment: Alignment.center,
      width: double.infinity,
      child: Text(
        Strings.save,
        style: TextStyles().searchHintTextStyle,
      ),
    );
  }

  popularView(){
    return Row(
      children: [
      Obx((){
        return   SizedBox(
          height: 24.0,
          width: 24.0,
          child: Checkbox(
            activeColor: AppColor.themeColor,
            splashRadius: 0.0,
            value: controller.popularStatus?.value,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            onChanged: (bool? newValue) {
              controller.popularStatus?.value = newValue??false;
            },
          ),
        );
      }),
        width03,
        Text(
          Strings.popularSatsang,
          style: TextStyles().satsangTitleTextStyle,
        ),
      ],
    );
  }
}
