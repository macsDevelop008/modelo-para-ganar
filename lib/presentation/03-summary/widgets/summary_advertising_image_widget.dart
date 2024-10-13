import 'package:flutter/material.dart';

class SummaryAdvertisingImageWidget extends StatelessWidget {
  const SummaryAdvertisingImageWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.pathImg});

  final double height;
  final double width;
  final String pathImg;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      pathImg,
      fit: BoxFit.contain,
    );
  }
}
