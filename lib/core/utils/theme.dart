import 'package:bookia/core/contants/app_fonts.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // ignore: strict_top_level_inference
  static get lightTheme => ThemeData(
    scaffoldBackgroundColor: Appcolors.whitecolor,
    fontFamily: AppFonts.dmsheifFamily,
    appBarTheme: AppBarTheme(
      backgroundColor: Appcolors.whitecolor,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Appcolors.primarycolor,
      onSurface: Appcolors.blackcolor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Appcolors.accentcolor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),

    dividerTheme: DividerThemeData(color: Appcolors.bordercolor),

    inputDecorationTheme: InputDecorationTheme(
      fillColor: Appcolors.accentcolor,
      filled: true,
      hintStyle: TextStyles.styleSize14(color: Appcolors.grycolor),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Appcolors.bordercolor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Appcolors.bordercolor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Appcolors.redcolor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Appcolors.redcolor),
      ),
    ),
  );
}
