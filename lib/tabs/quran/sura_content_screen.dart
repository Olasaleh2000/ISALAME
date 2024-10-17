import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/tabs/settings/settings.dart';
import 'package:islami/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class SuraContentScreen extends StatefulWidget {
  SuraContentScreen({super.key});

  static const String routeName = 'sura_content_screen';

  @override
  State<SuraContentScreen> createState() => _SuraContentScreenState();
}

class _SuraContentScreenState extends State<SuraContentScreen> {
  List<String> suraContent = [];

  late SuraContentArgs args;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    args = ModalRoute.of(context)!.settings.arguments as SuraContentArgs;
    if (suraContent.isEmpty) {
      loadSuraFile();
    }
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/${settingsProvider.backgroundImage}.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('إسلامي'),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: settingsProvider.isDark
                  ? AppTheme.darkPrimary
                  : AppTheme.white,
              borderRadius: BorderRadius.circular(25),
            ),
            height: size.height * 0.75,
            width: size.width * 0.86,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('سورة ${args.suraName}',
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(width: 16),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: Icon(
                    //     Icons.play_arrow,
                    //     size: 32,
                    //   ),
                    //   style: IconButton.styleFrom(
                    //     backgroundColor: AppTheme.black,
                    //     foregroundColor: AppTheme.white,
                    //   ),
                    //   padding: EdgeInsets.zero,
                    // ),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: settingsProvider.isDark
                          ? AppTheme.gold
                          : AppTheme.black,
                      foregroundColor: settingsProvider.isDark
                          ? AppTheme.black
                          : AppTheme.white,
                      child: Icon(
                        Icons.play_arrow,
                        size: 22,
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  indent: 50,
                  endIndent: 50,
                  color: AppTheme.lightPrimary,
                ),
                Expanded(
                  child: suraContent.isEmpty
                      ? LoadingIndicator()
                      : ListView.builder(
                          padding: EdgeInsets.all(12),
                          itemBuilder: (context, index) => Text(
                            suraContent[index],
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          itemCount: suraContent.length,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loadSuraFile() async {
    // await Future.delayed(Duration(seconds: 1));
    String sura =
        await rootBundle.loadString('assets/text/${args.index + 1}.txt');
    suraContent = sura.split('\r\n');
    setState(() {});
  }
}
