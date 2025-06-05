import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/strings.dart';

class ImageView extends StatelessWidget {
  String? imageType;
  final String imageUrl;
  final  height;
  final  width;
  final dynamic boxFit;
  final dynamic imageColor;

  ImageView({super.key,this.imageType,required this.imageUrl,required this.height,required this.width,required this.boxFit,this.imageColor});

  @override
  Widget build(BuildContext context) {
    return imageType=="png"?
    Image.asset(
      Strings.imageBaseurl+imageUrl,
      height: height,
      width: width,
      fit: boxFit,
      alignment: Alignment.center,
    ):
    imageType=="svg"?
    SvgPicture.asset(
      Strings.imageBaseurl+imageUrl,
      height: height,
      width: width,
      fit: boxFit,
      color: imageColor,
    ):
    CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: boxFit,
      color: imageColor,
    );
  }
}