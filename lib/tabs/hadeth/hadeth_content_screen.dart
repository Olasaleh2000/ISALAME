import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app_theme.dart';

import 'hadeth.dart';

class HadithContentScreen extends StatefulWidget {
  static const String routName = '/hadith_content';

  const HadithContentScreen({super.key});

  @override
  State<HadithContentScreen> createState() => _HadithContentScreenState();
}

class _HadithContentScreenState extends State<HadithContentScreen> {
  List<String> hadithContent = [];
  late Hadeth args;

  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    if (hadithContent.isEmpty) {
      loadHadithFile();
    }

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/default_bg.png'),
        fit: BoxFit.fill,
      )),
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
              color: AppTheme.white, borderRadius: BorderRadius.circular(25)),
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
