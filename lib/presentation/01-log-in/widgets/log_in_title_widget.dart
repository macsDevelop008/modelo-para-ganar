import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';

class LogInTitleWidget extends StatelessWidget {
  const LogInTitleWidget({super.key, required this.title, required this.size});

  final String title;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow.withOpacity(0),
      child: Text(
        title,
        style: TextStyle(
            color: AppColors.seventh,
            fontFamily: 'NotoSans',
            fontWeight: FontWeight.w700,
            fontSize: size),
      ),
    );
  }
}
