import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';

class LogInSubtitleWidget extends StatelessWidget {
  const LogInSubtitleWidget(
      {super.key,
      required this.title,
      required this.size,
      required this.marginTop});

  final String title;
  final double size;
  final double marginTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.withOpacity(0.0),
      margin: EdgeInsets.only(top: marginTop),
      child: Text(
        title,
        style: TextStyle(
            color: AppColors.seventh,
            fontFamily: 'NotoSans',
            fontWeight: FontWeight.w400,
            fontSize: size),
      ),
    );
  }
}
