import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/resources/colors_manager.dart';

class ThemeManager {
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorsManager.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.transparent,
      primary: ColorsManager.black,
      secondary: ColorsManager.black,
      onSecondary: ColorsManager.black,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.white,
      iconTheme: IconThemeData(color: ColorsManager.black),
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black,
      ),
      centerTitle: true,
    ),

    iconTheme: IconThemeData(color: ColorsManager.white),
    drawerTheme: DrawerThemeData(backgroundColor: ColorsManager.black),
    tabBarTheme: TabBarThemeData(
      tabAlignment: TabAlignment.start,
      dividerColor: Colors.transparent,
      indicatorColor: ColorsManager.black,
      labelStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.black,
      ),
      unselectedLabelColor: ColorsManager.black.withValues(alpha: 5.0),
    ),
    cardTheme: CardThemeData(
      color: ColorsManager.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(84.r),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.all(16),
        minimumSize: Size(double.infinity, 0),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ColorsManager.white,
    ),
    dividerTheme: DividerThemeData(
      color: ColorsManager.white,
      indent: 8.w,
      endIndent: 8.w,
      thickness: 1,
    ),
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.inter(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.black,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),

      headlineSmall: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.black,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.white,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.white,
      ),
      displayLarge: GoogleFonts.inter(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.black,
      ),
    ),
  );

  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ColorsManager.black,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.transparent,
      primary: ColorsManager.white,
      secondary: ColorsManager.white,
      onSecondary: ColorsManager.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.black,
      iconTheme: IconThemeData(color: ColorsManager.white),
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
      centerTitle: true,
    ),
    iconTheme: IconThemeData(color: ColorsManager.white),
    drawerTheme: DrawerThemeData(backgroundColor: ColorsManager.black),
    tabBarTheme: TabBarThemeData(
      tabAlignment: TabAlignment.start,
      dividerColor: Colors.transparent,
      indicatorColor: ColorsManager.white,
      labelStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.white,
      ),
      unselectedLabelColor: ColorsManager.grey,
    ),
    cardTheme: CardThemeData(
      color: ColorsManager.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(84.r),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.all(16),
        minimumSize: Size(double.infinity, 0),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ColorsManager.white,
    ),
    dividerTheme: DividerThemeData(
      color: ColorsManager.white,
      indent: 8.w,
      endIndent: 8.w,
      thickness: 1,
    ),
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.inter(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.black,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black,
      ),

      headlineSmall: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.white,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.white,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.black,
      ),
      displayLarge: GoogleFonts.inter(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.white,
      ),
    ),
  );
}
