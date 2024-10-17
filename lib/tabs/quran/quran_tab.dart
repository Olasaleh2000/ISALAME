import 'package:flutter/material.dart';
import 'package:islami/tabs/quran/sura_content_screen.dart';
import 'package:islami/tabs/settings/settings.dart';
import 'package:provider/provider.dart';

class QuranTab extends StatelessWidget {
  QuranTab({super.key});
  static const List<Map<String, dynamic>> surasWithAyahs = [
    {"name": "الفاتحة", "ayahs": 7},
    {"name": "البقرة", "ayahs": 286},
    {"name": "آل عمران", "ayahs": 200},
    {"name": "النساء", "ayahs": 176},
    {"name": "المائدة", "ayahs": 120},
    {"name": "الأنعام", "ayahs": 165},
    {"name": "الأعراف", "ayahs": 206},
    {"name": "الأنفال", "ayahs": 75},
    {"name": "التوبة", "ayahs": 129},
    {"name": "يونس", "ayahs": 109},
    {"name": "هود", "ayahs": 123},
    {"name": "يوسف", "ayahs": 111},
    {"name": "الرعد", "ayahs": 43},
    {"name": "إبراهيم", "ayahs": 52},
    {"name": "الحجر", "ayahs": 99},
    {"name": "النحل", "ayahs": 128},
    {"name": "الإسراء", "ayahs": 111},
    {"name": "الكهف", "ayahs": 110},
    {"name": "مريم", "ayahs": 98},
    {"name": "طه", "ayahs": 135},
    {"name": "الأنبياء", "ayahs": 112},
    {"name": "الحج", "ayahs": 78},
    {"name": "المؤمنون", "ayahs": 118},
    {"name": "النّور", "ayahs": 64},
    {"name": "الفرقان", "ayahs": 77},
    {"name": "الشعراء", "ayahs": 227},
    {"name": "النّمل", "ayahs": 93},
    {"name": "القصص", "ayahs": 88},
    {"name": "العنكبوت", "ayahs": 69},
    {"name": "الرّوم", "ayahs": 60},
    {"name": "لقمان", "ayahs": 34},
    {"name": "السجدة", "ayahs": 30},
    {"name": "الأحزاب", "ayahs": 73},
    {"name": "سبأ", "ayahs": 54},
    {"name": "فاطر", "ayahs": 45},
    {"name": "يس", "ayahs": 83},
    {"name": "الصافات", "ayahs": 182},
    {"name": "ص", "ayahs": 88},
    {"name": "الزمر", "ayahs": 75},
    {"name": "غافر", "ayahs": 85},
    {"name": "فصّلت", "ayahs": 54},
    {"name": "الشورى", "ayahs": 53},
    {"name": "الزخرف", "ayahs": 89},
    {"name": "الدّخان", "ayahs": 59},
    {"name": "الجاثية", "ayahs": 37},
    {"name": "الأحقاف", "ayahs": 35},
    {"name": "محمد", "ayahs": 38},
    {"name": "الفتح", "ayahs": 29},
    {"name": "الحجرات", "ayahs": 18},
    {"name": "ق", "ayahs": 45},
    {"name": "الذاريات", "ayahs": 60},
    {"name": "الطور", "ayahs": 49},
    {"name": "النجم", "ayahs": 62},
    {"name": "القمر", "ayahs": 55},
    {"name": "الرحمن", "ayahs": 78},
    {"name": "الواقعة", "ayahs": 96},
    {"name": "الحديد", "ayahs": 29},
    {"name": "المجادلة", "ayahs": 22},
    {"name": "الحشر", "ayahs": 24},
    {"name": "الممتحنة", "ayahs": 13},
    {"name": "الصف", "ayahs": 14},
    {"name": "الجمعة", "ayahs": 11},
    {"name": "المنافقون", "ayahs": 11},
    {"name": "التغابن", "ayahs": 18},
    {"name": "الطلاق", "ayahs": 12},
    {"name": "التحريم", "ayahs": 12},
    {"name": "الملك", "ayahs": 30},
    {"name": "القلم", "ayahs": 52},
    {"name": "الحاقة", "ayahs": 52},
    {"name": "المعارج", "ayahs": 44},
    {"name": "نوح", "ayahs": 28},
    {"name": "الجن", "ayahs": 28},
    {"name": "المزّمّل", "ayahs": 20},
    {"name": "المدّثر", "ayahs": 56},
    {"name": "القيامة", "ayahs": 40},
    {"name": "الإنسان", "ayahs": 31},
    {"name": "المرسلات", "ayahs": 50},
    {"name": "النبأ", "ayahs": 40},
    {"name": "النازعات", "ayahs": 46},
    {"name": "عبس", "ayahs": 42},
    {"name": "التكوير", "ayahs": 29},
    {"name": "الإنفطار", "ayahs": 19},
    {"name": "المطفّفين", "ayahs": 36},
    {"name": "الإنشقاق", "ayahs": 25},
    {"name": "البروج", "ayahs": 22},
    {"name": "الطارق", "ayahs": 17},
    {"name": "الأعلى", "ayahs": 19},
    {"name": "الغاشية", "ayahs": 26},
    {"name": "الفجر", "ayahs": 30},
    {"name": "البلد", "ayahs": 20},
    {"name": "الشمس", "ayahs": 15},
    {"name": "الليل", "ayahs": 21},
    {"name": "الضحى", "ayahs": 11},
    {"name": "الشرح", "ayahs": 8},
    {"name": "التين", "ayahs": 8},
    {"name": "العلق", "ayahs": 19},
    {"name": "القدر", "ayahs": 5},
    {"name": "البينة", "ayahs": 8},
    {"name": "الزلزلة", "ayahs": 8},
    {"name": "العاديات", "ayahs": 11},
    {"name": "القارعة", "ayahs": 11},
    {"name": "التكاثر", "ayahs": 8},
    {"name": "العصر", "ayahs": 3},
    {"name": "الهمزة", "ayahs": 9},
    {"name": "الفيل", "ayahs": 5},
    {"name": "قريش", "ayahs": 4},
    {"name": "الماعون", "ayahs": 7},
    {"name": "الكوثر", "ayahs": 3},
    {"name": "الكافرون", "ayahs": 6},
    {"name": "النصر", "ayahs": 3},
    {"name": "المسد", "ayahs": 5},
    {"name": "الإخلاص", "ayahs": 4},
    {"name": "الفلق", "ayahs": 5},
    {"name": "الناس", "ayahs": 6},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Column(
      children: [
        Image.asset(
          'assets/images/qur2an_screen_logo.png',
          height: size.height * 0.26,
          width: size.width * 0.49,
        ),
        Expanded(
          child: Stack(children: [
            Column(
              children: [
                Divider(
                  thickness: 3,
                  color: Theme.of(context).primaryColor,
                ),
                Row(
                  children: [
                    Spacer(flex: 1),
                    Text(
                      'عدد الآيات',
                      style: TextStyle(
                        fontFamily: 'ElMessiri',
                        fontSize: 25,
                        color: settingsProvider.isDark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    Spacer(flex: 2),
                    Text(
                      'إسم السورة',
                      style: TextStyle(
                        fontFamily: 'ElMessiri',
                        fontSize: 25,
                        color: settingsProvider.isDark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
                Divider(
                  thickness: 3,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 70),
              child: ListView.separated(
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(SuraContentScreen.routeName,
                        arguments: SuraContentArgs(
                          suraName: surasWithAyahs[index]["name"],
                          index: index,
                        ));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 90,
                      ),
                      Text(
                        surasWithAyahs[index]["ayahs"].toString(),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Spacer(),
                      Text(
                        surasWithAyahs[index]["name"],
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        width: 70,
                      ),
                    ],
                  ),
                ),
                itemCount: surasWithAyahs.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
              ),
            ),
            Center(
              child: VerticalDivider(
                indent: 7,
                thickness: 3,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}

class SuraContentArgs {
  final String suraName;
  final int index;

  SuraContentArgs({required this.suraName, required this.index});
}
