import 'package:flutter/material.dart';
import 'package:islami/tabs/settings/language.dart';
import 'package:islami/tabs/settings/settings.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  static const String routeName = 'settings';

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  List<Language> languages = [
    Language(name: 'English', code: 'en'),
    Language(name: 'العربية', code: 'ar')
  ];

  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark Theme ',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                Switch(
                  value: settingsProvider.isDark,
                  onChanged: (isDark) {
                    settingsProvider.changeTheme(
                      isDark ? ThemeMode.dark : ThemeMode.light,
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Language',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w500)),
                DropdownButtonHideUnderline(
                  child: DropdownButton<Language>(
                    value: languages.first,
                    items: languages
                        .map(
                          (language) => DropdownMenuItem(
                            value: language,
                            child: Text(language.name),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      print(value?.name);
                    },
                    borderRadius: BorderRadius.circular(20),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
