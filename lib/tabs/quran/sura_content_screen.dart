import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test1/tabs/quran/quran_tab.dart';

import '../../app_theme.dart';
import '../../widgets/load_indictor.dart';

class SuraContentScreen extends StatefulWidget {
  static const String routName = '/sura_content';

  const SuraContentScreen({super.key});

  @override
  State<SuraContentScreen> createState() => _SuraContentScreenState();
}

class _SuraContentScreenState extends State<SuraContentScreen> {
  List<String> ayat = [];

  late SuraContentArgs args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as SuraContentArgs;
    if (ayat.isEmpty) {
      LoadSuraFile();
    }

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/default_bg.png'),
          fit: BoxFit.fill,
        )),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.suraName),
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.sizeOf(context).height * 0.07,
                horizontal: 24),
            decoration: BoxDecoration(
                color: AppTheme.white, borderRadius: BorderRadius.circular(25)),
            child: ayat.isEmpty
                ? LodaIndictor()
                : ListView.builder(
                    itemBuilder: (_, index) => Text(
                      ayat[index],
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    itemCount: ayat.length,
                  ),
          ),
        ));
  }

  Future<void> LoadSuraFile() async {
    String sura =
        await rootBundle.loadString('assets/text/${args.index + 1}.txt');
    ayat = sura.split('\r\n');
    setState(() {});
  }
}
