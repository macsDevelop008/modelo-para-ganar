import 'package:flutter/material.dart';

class SelfExecutingScreen extends StatelessWidget {
  const SelfExecutingScreen({super.key});

  static const String name = 'self-executing-screen';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Tamaños
        //final height = constraints.maxHeight;
        //final width = constraints.maxWidth;
        return const Center(child: Text('Self-Executing'));
      },
    );
  }
}
