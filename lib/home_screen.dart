import 'package:flutter/material.dart';
import 'package:test1/tabs/hadeth/hadeth_tab.dart';
import 'package:test1/tabs/quran/quran_tab.dart';
import 'package:test1/tabs/radio/radio_tab.dart';
import 'package:test1/tabs/sebha/sebha_tab.dart';

//import 'tabs/settings/setting_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    //  SettingsTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/default_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('اسلامي'),
        ),
        body: tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icon_quran.png')),
              label: 'Quran',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icon_hadeth.png')),
              label: 'Hadeth',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icon_sebha.png')),
              label: 'Sebha',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icon_radio.png')),
              label: 'Radio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
