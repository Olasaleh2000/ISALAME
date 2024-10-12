import 'package:flutter/material.dart';

class LodaIndictor extends StatelessWidget {
  const LodaIndictor({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
