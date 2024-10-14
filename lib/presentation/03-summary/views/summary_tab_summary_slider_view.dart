import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

class SummaryTabSummarySliderView extends StatelessWidget {
  const SummaryTabSummarySliderView(
      {super.key,
      required this.height,
      required this.width,
      required this.percentageValue});

  final double height;
  final double width;
  final double percentageValue;

  @override
  Widget build(BuildContext context) {
    // Tamaños base
    final widthBase = width;
    final heightBase = height * 0.13;
    return Container(
      alignment: Alignment.topLeft,
      color: Colors.green.withOpacity(0.0),
      width: widthBase,
      height: heightBase,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          //! Slider personalizado
          SummaryTabSummarySliderWidget(
            heightBar: heightBase * 0.4,
            width: widthBase * 0.85,
            valueSlider: percentageValue,
          ),
          //! Esfera porcentaje final del slider
          Positioned(
            right: 0,
            child: SummaryTabSummaryCircleTextWidget(
              size: heightBase * 0.9,
              valueSlider: percentageValue,
            ),
          ),
        ],
      ),
    );
  }
}
