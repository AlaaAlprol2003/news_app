// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:news_app/features/home/categories/categories_view.dart';
import 'package:news_app/features/home/categories/home_drawer/home_drawer.dart';
import 'package:news_app/features/home/sources/source_view.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/models/news_category.dart';
import 'package:news_app/providers/home_view_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeViewProvider>(context);
    var appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(provider.title == "Home" ? appLocalizations.home : provider.title),surfaceTintColor: Colors.transparent,),
      drawer: HomeDrawer(),
      body: provider.homeView,
    );
  }
}
