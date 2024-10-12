import 'package:flutter/material.dart';
import 'package:test1/app_theme.dart';
import 'package:test1/home_screen.dart';
import 'package:test1/tabs/hadeth/hadeth_content_screen.dart';
import 'package:test1/tabs/quran/sura_content_screen.dart';
import 'package:test1/tabs/settings/setting_tab.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraContentScreen.routName: (_) => SuraContentScreen(),
        HadithContentScreen.routName: (_) => HadithContentScreen(),
        // SettingsTab.routeName: (context) => SettingsTab(),
      },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
