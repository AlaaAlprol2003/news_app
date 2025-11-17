import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/prefs_manager/prefs_manager.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/features/home/categories/home_drawer/change_theme_and_lang_widget.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/providers/home_view_provider.dart';
import 'package:news_app/providers/lanaguge_provider.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeViewProvider>(context);
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanagugeProvider lanagugeProvider = Provider.of<LanagugeProvider>(context);

    var appLocalizations = AppLocalizations.of(context)!;

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
              appLocalizations.news_app,
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
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          provider.backToHome(context);
                        },
                        child: Text(
                          appLocalizations.go_to_home,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                SizedBox(height: 16.h),
                ChangeThemeAndLangWidget(
                  icon: Icons.format_paint,
                  label: appLocalizations.theme,
                  menuItems: [appLocalizations.dark, appLocalizations.light],
                  selectedItem: themeProvider.currentTheme == ThemeMode.dark
                      ? appLocalizations.dark
                      : appLocalizations.light,
                  onChanged: (newTheme) {
                    themeProvider.changeTheme(
                      newTheme == appLocalizations.light
                          ? ThemeMode.light
                          : ThemeMode.dark,
                    );
                    PrefsManager.cacheTheme(
                      newTheme == appLocalizations.light
                          ? ThemeMode.light
                          : ThemeMode.dark,
                    );
                  },
                ),
                SizedBox(height: 16.h),
                Divider(),
                SizedBox(height: 16.h),
                ChangeThemeAndLangWidget(
                  label: appLocalizations.lanaguge,
                  icon: Icons.public_rounded,
                  menuItems: ["English", "عربى"],
                  selectedItem: lanagugeProvider.currentLanaguge == "en"
                      ? "English"
                      : "عربى",
                  onChanged: (newLanaguge) {
                    lanagugeProvider.chanageLanaguge(
                      newLanaguge == "English" ? "en" : "ar",
                    );
                    PrefsManager.cacheLanaguge(newLanaguge ?? "en");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
