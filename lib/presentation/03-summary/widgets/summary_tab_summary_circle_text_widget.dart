import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';

class SummaryTabSummaryCircleTextWidget extends StatelessWidget {
  const SummaryTabSummaryCircleTextWidget(
      {super.key, required this.size, required this.valueSlider});

  final double size;
  final double valueSlider;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        // Tamaño radial
        height: size,
        width: size,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(size)),
            boxShadow: [
              BoxShadow(
                  color: AppColors.first.withOpacity(0.5),
                  blurRadius: size * 0.1,
                  spreadRadius: size * 0.09)
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.sixteenth, AppColors.sixteenth])),
        child: Text(
          '${valueSlider.toStringAsFixed(0)}%',
          style: TextStyle(
            fontFamily: 'NotoSans',
            fontSize: size * 0.45,
            color: AppColors.seventh,
            fontWeight: FontWeight.w700,
          ),
        ));
  }
}
