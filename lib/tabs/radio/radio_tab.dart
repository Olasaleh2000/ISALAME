import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

class RadioTab extends StatelessWidget {
  static const String routeName = 'radio';

  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          const Spacer(),
          Image.asset(
            'assets/images/radio_image.png',
            width: 400,
          ),
          const SizedBox(height: 70),
          Text(
            'إذاعة القرآن الكريم',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: theme.textTheme.headlineSmall?.color ?? Colors.black87,
            ),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.skip_previous),
                iconSize: 40,
                color: AppTheme.lightPrimary,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.play_arrow),
                iconSize: 50,
                color: AppTheme.lightPrimary,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.skip_next),
                iconSize: 40,
                color: AppTheme.lightPrimary,
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
