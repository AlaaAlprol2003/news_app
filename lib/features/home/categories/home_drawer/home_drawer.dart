import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/features/home/categories/home_drawer/change_theme_and_lang_widget.dart';
import 'package:news_app/providers/home_view_provider.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});
  
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeViewProvider>(context);
    return Drawer(
      backgroundColor: ColorsManager.black,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200.h,
            alignment: Alignment.center,
            color: ColorsManager.white,
            child: Text(
              "News App",
              style: GoogleFonts.inter(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.black,
              ),
            ),
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.home_outlined),
                    SizedBox(width: 12.w),
                    TextButton(
                      onPressed: () {
                        provider.backToHome(context);
                      },
                      child: Text(
                        "Go To Home",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
                Divider(),
                SizedBox(height: 16.h),
                ChangeThemeAndLangWidget(
                  icon: Icons.format_paint,
                  label: "Theme",
                  menuItems: ["Dark", "Light"],
                  selectedItem: "Dark",
                ),
                SizedBox(height: 16.h),
                Divider(),
                SizedBox(height: 16.h),
                ChangeThemeAndLangWidget(
                  label: "Lanaguge",
                  icon: Icons.public_rounded,
                  menuItems: ["English", "عربى"],
                  selectedItem: "English",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
