import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/settings/settings.dart';
import 'package:provider/provider.dart';

class HadethContentScreen extends StatefulWidget {
  static const routeName = 'hadeth_content_screen';

  @override
  State<HadethContentScreen> createState() => _HadethContentScreenState();
}

class _HadethContentScreenState extends State<HadethContentScreen> {
  List<String> hadithContent = [];
  late Hadeth args;

  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    if (hadithContent.isEmpty) {
      loadHadithFile();
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
          title: Text(hadeth.title),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height * 0.07,
              horizontal: 24),
          decoration: BoxDecoration(
              color:
                  settingsProvider.isDark ? AppTheme.darkPrimary : Colors.white,
              borderRadius: BorderRadius.circular(25)),
          child: ListView.builder(
            itemBuilder: (_, index) => Text(
              hadeth.content[index],
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            itemCount: hadeth.content.length,
          ),
        ),
      ),
    );
  }

  Future<void> loadHadithFile() async {
    String hadith = await rootBundle.loadString('assets/text/hadith.txt');
    hadithContent = hadith.split('\r\n');
    setState(() {});
  }
}
