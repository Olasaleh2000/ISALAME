import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/pages/home_screen.dart';
import 'package:islami/tabs/hadeth/hadeth_content_screen.dart';
import 'package:islami/tabs/quran/sura_content_screen.dart';
import 'package:islami/tabs/settings/settings.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => SettingsProvider(),
    child: Islami(),
  ));
}

class Islami extends StatelessWidget {
  const Islami({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: settingsProvider.isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
      themeMode: settingsProvider.themeMode,
      routes: {
        '/': (context) => BottmNav(),
        SuraContentScreen.routeName: (context) => SuraContentScreen(),
        HadethContentScreen.routeName: (context) => HadethContentScreen(),
      },
      initialRoute: '/',
    );
  }
}
