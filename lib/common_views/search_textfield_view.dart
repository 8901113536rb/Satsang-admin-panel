import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../utils/colors.dart';
import '../utils/textstyles.dart';

class SearchTextfieldView extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  Widget? prefixIcon;
  int? maxLines;
  double? cursorHeight;
  bool? readOnlyStatus;

  SearchTextfieldView({super.key,
    required this.hint,
    required this.controller,
    this.prefixIcon,
    this.maxLines,
    this.cursorHeight,
    this.readOnlyStatus
  });

  _SearchTextfieldViewState createState() => _SearchTextfieldViewState();
}

class _SearchTextfieldViewState extends State<SearchTextfieldView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 5.h,
      child: TextFormField(
        readOnly: widget.readOnlyStatus??false,
        cursorHeight: widget.cursorHeight,
        maxLines: widget.maxLines,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: AppColor.themeColor,
        style: TextStyles().hintTextStyle,
        controller: widget.controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 4.w),
           // isDense: true,
           //  filled: true,
           //  fillColor: AppColor.whiteColor,
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: AppColor.blackColor),
            ),
            hintStyle: TextStyles().hintTextStyle,
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: AppColor.blackColor),
            ),
            border: OutlineInputBorder(
              borderRadius:const BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: AppColor.blackColor),
            ),
            hintText: widget.hint,
            prefixIcon:widget.prefixIcon
        ),
      ),
    );
  }
}