import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColor {
  static const primaryone = Color(0xd3ffd500);
  static const primarydark = Color(0xffff5900);
  static const blackColor = Color(0xff1C2340);
  static const redColor = Colors.red;
  static const alphaGrey = Color(0xffF5F3F3);
  static const whiteColor = Colors.white;
  static const greyColor = Colors.grey;
  static const green = Colors.green;
}

class AppTextStyles {
  static final _fontBold = GoogleFonts.roboto(
      textStyle: const TextStyle(
          fontWeight: FontWeight.bold, color: AppColor.blackColor));
  static final _fontNormal = GoogleFonts.roboto(
      textStyle: const TextStyle(
          fontWeight: FontWeight.normal, color: AppColor.blackColor));

  static TextStyle textStyleBoldTitleLarge = _fontBold.copyWith(fontSize: 28);

  static TextStyle textStyleBoldSubTitleLarge =
      _fontBold.copyWith(fontSize: 20);

  static TextStyle textStyleNormalLargeTitle =
      _fontNormal.copyWith(fontSize: 20);
  static TextStyle textStyleBoldBodyMedium = _fontBold.copyWith(fontSize: 16);
  static TextStyle textStyleNormalBodyMedium =
      _fontNormal.copyWith(fontSize: 16);
  static TextStyle textStyleBoldBodySmall = _fontBold.copyWith(fontSize: 14);
  static TextStyle textStyleNormalBodySmall =
      _fontNormal.copyWith(fontSize: 14);
  static TextStyle textStyleBoldBodyXSmall = _fontBold.copyWith(fontSize: 12);
  static TextStyle textStyleNormalBodyXSmall =
      _fontNormal.copyWith(fontSize: 12);
}
