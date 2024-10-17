import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/hadeth/hadeth_content_screen.dart';

class HadethTab extends StatefulWidget {
  HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAhadethFile();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.asset(
          'assets/images/hadeth_logo.png',
          height: size.height * 0.26,
          width: size.width * 0.49,
          fit: BoxFit.cover,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  HadethContentScreen.routeName,
                  arguments: ahadeth[index],
                );
              },
              child: Center(
                child: Text(
                  ahadeth[index].title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            itemCount: ahadeth.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
          ),
        ),
      ],
    );
  }

  Future<void> loadAhadethFile() async {
    // await Future.delayed(Duration(seconds: 1));
    String ahadethFileContent =
        await rootBundle.loadString('assets/text/ahadeth.txt');
    List<String> ahadethStrings = ahadethFileContent.split('#');
    ahadeth = ahadethStrings.map((hadethString) {
      List<String> hadethLines = hadethString.trim().split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      List<String> content = hadethLines;
      return Hadeth(title: title, content: content);
    }).toList();
    setState(() {});
  }
}
