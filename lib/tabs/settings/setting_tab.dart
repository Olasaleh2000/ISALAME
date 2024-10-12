import 'package:flutter/material.dart';

class SettingsTab extends StatefulWidget {
  final Function toggleTheme; // دالة لتغيير الثيم
  final Function changeLanguage; // دالة لتغيير اللغة
  final bool isDarkMode; // الوضع الحالي (ليلي/فاتح)
  //final toggleTheme;

  SettingsTab({
    required this.toggleTheme,
    required this.changeLanguage,
    required this.isDarkMode,
    //   required this.toggleTheme
  });

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String selectedLanguage = 'English'; // اللغة الافتراضية

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الإعدادات'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // عنصر تبديل الوضع الليلي
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('الوضع الليلي', style: TextStyle(fontSize: 20)),
                Switch(
                  value: widget.isDarkMode,
                  onChanged: (value) {
                    widget.toggleTheme(); // استدعاء الدالة لتغيير الثيم
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            // عنصر اختيار اللغة
            Text('اللغة', style: TextStyle(fontSize: 20)),
            DropdownButton<String>(
              value: selectedLanguage,
              items:
                  <String>['English', 'العربية', 'Spanish'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue!;
                  if (selectedLanguage == 'English') {
                    widget.changeLanguage('en');
                  } else if (selectedLanguage == 'العربية') {
                    widget.changeLanguage('ar');
                  } else if (selectedLanguage == 'Spanish') {
                    widget.changeLanguage('es');
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
