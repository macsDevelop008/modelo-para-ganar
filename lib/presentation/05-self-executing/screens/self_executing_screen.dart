import 'package:flutter/material.dart';

class SelfExecutingScreen extends StatelessWidget {
  const SelfExecutingScreen({super.key});

  static const String name = 'self-executing-screen';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (didPop) {
        if (didPop) {
          debugPrint('PopScope: Se intentó hacer pop');
        }
        debugPrint('PopScope: No se puede hacer pop');
      },
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Tamaños
          //final height = constraints.maxHeight;
          //final width = constraints.maxWidth;
          return const Center(child: Text('Self-Executing'));
        },
      ),
    );
  }
}
