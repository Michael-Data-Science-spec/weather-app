import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/utils/constants/app_color.dart';

class AppTextStyles {
  static TextStyle searchPromptText = GoogleFonts.poppins(
      textStyle: const TextStyle(color: AppColors.textBlack, fontSize: 20));
  static TextStyle cityNameSmall = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: AppColors.textBlack,
          fontSize: 30,
          fontWeight: FontWeight.w500));
  static TextStyle cityNameBig = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: AppColors.textWhite,
          fontSize: 50,
          fontWeight: FontWeight.w500));
  static TextStyle degreeBig = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: AppColors.textWhite,
          fontSize: 80,
          fontWeight: FontWeight.w500));
  static TextStyle degreeSmall = GoogleFonts.poppins(
      textStyle: const TextStyle(
          color: AppColors.textWhite,
          fontSize: 24,
          fontWeight: FontWeight.w500));
}
