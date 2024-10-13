import 'package:flutter/material.dart';

class SummaryTabSummaryTextWidget extends StatelessWidget {
  const SummaryTabSummaryTextWidget(
      {super.key,
      required this.text,
      required this.color,
      required this.size,
      required this.fontWeight,
      required this.maxLines});

  final String text;
  final int maxLines;
  final Color color;
  final double size;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        maxLines: maxLines,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: 'NotoSans',
            fontSize: size,
            fontWeight: fontWeight,
            color: color),
      ),
    );
  }
}
