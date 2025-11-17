import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme_manager/theme_manager.dart';
import 'package:news_app/core/prefs_manager/prefs_manager.dart';
import 'package:news_app/core/routes_manager/routes_manager.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/providers/home_view_provider.dart';
import 'package:news_app/providers/lanaguge_provider.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LanagugeProvider()),
      ],
      child: NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanagugeProvider lanagugeProvider = Provider.of<LanagugeProvider>(context);

    return ScreenUtilInit(
      designSize: Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: RoutesManager.router,
        initialRoute: RoutesManager.homeScreen,
        theme: ThemeManager.light,
        darkTheme: ThemeManager.dark,
        themeMode: themeProvider.currentTheme,
        locale: Locale(lanagugeProvider.currentLanaguge),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
