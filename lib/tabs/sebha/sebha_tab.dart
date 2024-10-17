import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings/settings.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  _SebhaTabState createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 0.05).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _getTasbeehText() {
    if (_counter % 99 < 33) {
      return 'سبحان الله';
    } else if (_counter % 99 < 66) {
      return 'الله أكبر';
    } else {
      return 'الحمد لله';
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Positioned(
                left: 200,
                child: Image.asset(
                  'assets/images/${settingsProvider.sebhaHeadImage}.png',
                ),
              ),
              Container(
                height: 85,
                width: double.infinity,
              ),
            ],
          ),
          GestureDetector(
            onTap: _incrementCounter,
            child: RotationTransition(
              turns: _animation,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/${settingsProvider.sebhaBodyImage}.png',
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'عدد التسبيحات',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: settingsProvider.isDark
                  ? AppTheme.darkPrimary
                  : AppTheme.lightPrimary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.white,
                  ),
            ),
          ),
          SizedBox(height: 25),
          ElevatedButton(
            onPressed: _incrementCounter,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              backgroundColor: settingsProvider.isDark
                  ? AppTheme.gold
                  : AppTheme.lightPrimary,
            ),
            child: Text(
              _getTasbeehText(),
              style: TextStyle(
                  fontSize: 20,
                  color: settingsProvider.isDark
                      ? AppTheme.black
                      : AppTheme.white),
            ),
          ),
        ],
      ),
    );
  }
}
