import 'package:flutter/material.dart';

class SummaryTabSummayScreen extends StatelessWidget {
  const SummaryTabSummayScreen({super.key});

  static const String name = 'summary-tab-summary-screen';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Tamaños
        //final height = constraints.maxHeight;
        //final width = constraints.maxWidth;
        return const Center(child: Text('summary-tab-summary-screen'));
      },
    );
  }
}
