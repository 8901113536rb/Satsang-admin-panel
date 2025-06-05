import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:msgadminpanel/bhajan/bhajan_view.dart';
import 'package:msgadminpanel/category_bhajan/category_bhajan_view.dart';
import 'package:msgadminpanel/category_satsang/category_satsang_view.dart';
import 'package:msgadminpanel/utils/imageurls.dart';
import 'package:msgadminpanel/utils/sizes.dart';
import 'package:sizer/sizer.dart';
import '../category/category_view.dart';
import '../common_views/image_view.dart';
import '../satsang/satsang_view.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';
import '../utils/textstyles.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold( body: body(),
    ));
  }
  body(){
    return Column(
     children: [
       appBarView(),
       height2,
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           drawerView(),
           bodyView()
         ],
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
        child: Text(
          Strings.dashboard,
          style: TextStyles().addSatsangVideoTextStyle,
        ),
      ),
    );
  }

  drawerView(){
    return Container(
      color: AppColor.profileBgColor.withOpacity(0.2),
      width: 18.w,
      height: 86.h,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 1.w,right: 1.w,top: 3.h,bottom: 3.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          drawerDesignView(ImageUrls.categoryImage,Strings.addCategory,(){
            Get.to(const CategoryView());
          }),
          height2,
          drawerDesignView(ImageUrls.satsangImage,Strings.addCategorySatSang,(){
            Get.to(const CategorySatsangView());
          }),
          height2,
          drawerDesignView(ImageUrls.bhajanImage,Strings.addCategoryBhajan,(){
            Get.to(const CategoryBhajanView());
          }),
          height2,
          drawerDesignView(ImageUrls.satsangImage,Strings.addSatSang,(){
            Get.to(const SatsangView());
          }),
          height2,
          drawerDesignView(ImageUrls.bhajanImage,Strings.addBhajan,(){
            Get.to(const BhajanView());
          }),
          height2,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(Icons.logout, color: AppColor.themeColor,)),
              width1,
              Text(
                Strings.logout,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColor.themeColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  drawerDesignView(imagePath,text,VoidCallback onTap){
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30.0,
            child: ImageView(
              imageType: "svg",
              imageUrl: imagePath,
              height: 1.1.w,
              width: 1.1.w,
              imageColor: AppColor.themeColor,
              boxFit: BoxFit.fill,
            ),
          ),
          width1,
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColor.themeColor,
            ),
          ),
        ],
      ),
    );
  }

  bodyView(){
    return Container(
      color: AppColor.profileBgColor.withOpacity(0.2),
      // height:60.h,
      width: 80.w,
      alignment: Alignment.center,
      child: Column(
        children: [
          titleView(),
          Container(
            height: 80.h,
            child: ListView.separated(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(
                top: 2.h, bottom: 2.h),
              itemCount: 16,
              itemBuilder: (BuildContext context, int index) {
                return  videoView();
              },
              separatorBuilder: (BuildContext context, int index) {
                return height1; // or Divider(), or any spacing widget
              },
            ),
          )

        ],
      ),
    );
  }

  titleView(){
    return Padding(
      padding: EdgeInsets.only(left: 2.w,right: 2.w,top: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 20.w,
            child: Text(
              Strings.videos,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColor.themeColor,
              ),
            ),
          ),
          Text(
            Strings.videoType,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColor.themeColor,
            ),
          ),
          Text(
            Strings.videoCategory,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColor.themeColor,
            ),
          ),
          Text(
            Strings.videoStatus,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColor.themeColor,
            ),
          ),
        ],
      ),
    );
  }

  videoView(){
    return Padding(
      padding: EdgeInsets.only(left: 2.w,right: 2.w,top: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   border: Border.all(color: AppColor.themeColor,width: 0.1.w),
                   // color: Colors.white,
                 ),
                 padding: EdgeInsets.only(left: 0.4.w,right: 0.4.w,top: 0.8.h,bottom: 0.8.h),
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(8.0),
                   child: ImageView(
                     imageType: "png",
                     imageUrl: ImageUrls.dummyImage,
                     height: 8.h,
                     width: 6.w,
                     boxFit: BoxFit.fill,
                   ),
                 ),
               ),
               width1,
               SizedBox(
                 height: 8.h,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(
                       width: 10.w,
                           height: 5.h,
                           child: Text("Foundation Month | Live Naam charcha Satsang...",
                           maxLines:3,
                           style: TextStyles().videoTitleTextStyle
                       ),
                     ),
                     Text(
                       "12 Dec 2025",
                       style: TextStyles().videoDateTitleTextStyle
                     ),
                   ],
                 ),
               )
             ],
           ),
          Text(
              "Satsang",
              style: TextStyles().videoTitleTextStyle
          ),
          Text(
              "Holi",
              style: TextStyles().videoTitleTextStyle
          ),
          Text(
              "Popular",
              style: TextStyles().videoTitleTextStyle
          ),
        ],
      ),
    );
  }
}
