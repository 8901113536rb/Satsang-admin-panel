import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msgadminpanel/utils/sizes.dart';
import 'package:sizer/sizer.dart';
import '../common_views/search_textfield_view.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';
import '../utils/textstyles.dart';
import 'category_controller.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: body(),
      ),
    );
  }

  body() {
    return SingleChildScrollView(
      child: Column(
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
                  Strings.categoryTitle,
                  style: TextStyles().satsangTitleTextStyle,
                ),
                height2,
                SearchTextfieldView(
                    hint: Strings.enterCategory,
                    controller: controller.titleController,
                    prefixIcon: Icon(
                      Icons.title,
                      color: AppColor.blackColor,
                      size: 15,
                    )),
                height8,
                saveButtonView(),
                height4,
              ],
            ),
          )
        ],
      ),
    );
  }

  appBarView() {
    return Center(
      child: Container(
        color: AppColor.profileBgColor.withOpacity(0.2),
        height: 10.h,
        width: double.infinity,
        alignment: Alignment.center,
        child:  Text(
          Strings.newCategory,
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
            Strings.clickDropBhajanVideo,
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
          Strings.popularBhajan,
          style: TextStyles().satsangTitleTextStyle,
        ),
      ],
    );
  }

  categoryView() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColor.blackColor),
      ),
      height: 6.5.h,
      width: double.infinity,
      padding: EdgeInsets.only(left: 1.w,right: 1.w),
      child:   Obx(() {
        return Theme(                           // <- Here
          data: Theme.of(context).copyWith(     // <- Here
            splashColor: Colors.transparent,    // <- Here
            highlightColor: Colors.transparent, // <- Here
            hoverColor: Colors.transparent,     // <- Here
          ),
          child: DropdownButton<String>(
            elevation: 0,
            autofocus: false,
            focusColor: Colors.white,
            value: controller.selectedCategory.value.isEmpty
                ? null
                : controller.selectedCategory.value,
            hint: Text(Strings.enterBhajanCategory,style: TextStyles().hintTextStyle,),
            isExpanded: true,
            underline: SizedBox(), // Remove underline
            items: controller.selectedCategoryList.map((String item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            )).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                controller.selectedCategory.value = newValue;
              }
            },
          ),
        );
      }),
    );
  }
}
