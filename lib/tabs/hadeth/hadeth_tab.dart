import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'hadeth.dart';
import 'hadeth_content_screen.dart';

class HadithTab extends StatefulWidget {
  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<Hadeth> ahadeth = [];

  @override
  void initState() {
    super.initState();
    if (ahadeth.isEmpty) {
      LoadAhadethFile();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/hadeth_logo.png',
          height: MediaQuery.sizeOf(context).height * 0.25,
        ),
        Expanded(
          child: ahadeth.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
                  padding: EdgeInsets.only(top: 16),
                  itemCount: ahadeth.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          HadithContentScreen.routName,
                          arguments: ahadeth[index],
                        );
                      },
                      child: ListTile(
                        title: Text(
                          'الحديث رقم  ${index + 1}',
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => SizedBox(height: 5),
                ),
        ),
      ],
    );
  }

  Future<void> LoadAhadethFile() async {
    String ahadethFileContent =
        await rootBundle.loadString('assets/text/ahadeth.txt');
    List<String> ahadethString = ahadethFileContent.split('#');

    setState(() {
      ahadeth = ahadethString.map((hadethString) {
        List<String> hadethLines = hadethString.trim().split('\n');
        String title = hadethLines[0];
        hadethLines.removeAt(0);
        List<String> content = hadethLines;
        return Hadeth(title, content);
      }).toList();
      setState(() {});
    });
  }
}
