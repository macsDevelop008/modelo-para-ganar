import 'package:flutter/material.dart';

class BonusScreen extends StatelessWidget {
  const BonusScreen({super.key});

  static const String name = 'bous-screen';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Tamaños
        //final height = constraints.maxHeight;
        //final width = constraints.maxWidth;
        return const Center(child: Text('bonus'));
      },
    );
  }
}
