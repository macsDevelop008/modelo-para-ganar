import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

class SummaryTabSummaryCirclesSliderDataView extends StatelessWidget {
  const SummaryTabSummaryCirclesSliderDataView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Tamaños base
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;

        // Tamaños base redondeada
        final baseHeight = height * 0.9;
        final baseWidth = width * 0.95;

        // Tamaños base sliderCircleText
        final baseHeightCirSlid = baseHeight * 0.88;
        final baseWidthCirSlid = baseWidth * 0.23;

        return
            // Base
            Container(
          alignment: Alignment.center,
          color: Colors.red.withOpacity(0),
          // Base esquinas redondeadas
          child: Container(
            width: baseWidth,
            height: baseHeight,
            decoration: BoxDecoration(
                // Color
                color: AppColors.second,
                // Borde
                border: Border.all(
                    color: AppColors.first.withOpacity(0.6),
                    width: baseHeight * 0.015),
                // Bordes redondeados
                borderRadius: BorderRadius.all(Radius.circular(height * 0.1)),
                // Sombra
                boxShadow: [
                  BoxShadow(
                      color: AppColors.first.withOpacity(0.5),
                      blurRadius: baseHeight * 0.02,
                      spreadRadius: baseHeight * 0.003)
                ]),
            child:
                // Items
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //! Widget - Arco Slider - Volumen
                SummaryTabSummaryCircularSliderPercentageWidget(
                  height: baseHeightCirSlid,
                  width: baseWidthCirSlid,
                  percentage: 90,
                  trackColor: AppColors.tenth,
                  progressBarColor1: AppColors.cirlceSlider1,
                  progressBarColor2: AppColors.cirlceSliderS1,
                  title: 'Vólumen',
                ),
                //! Widget - Arco Slider - Vol. Retomable
                SummaryTabSummaryCircularSliderPercentageWidget(
                  height: baseHeightCirSlid,
                  width: baseWidthCirSlid,
                  percentage: 1,
                  trackColor: AppColors.tenth,
                  progressBarColor1: AppColors.cirlceSlider2,
                  progressBarColor2: AppColors.cirlceSliderS2,
                  title: 'Vólumen',
                ),
                //! Widget - Arco Slider - Above + Beyond
                SummaryTabSummaryCircularSliderPercentageWidget(
                  height: baseHeightCirSlid,
                  width: baseWidthCirSlid,
                  percentage: 35,
                  trackColor: AppColors.tenth,
                  progressBarColor1: AppColors.cirlceSlider3,
                  progressBarColor2: AppColors.cirlceSliderS3,
                  title: 'Vólumen',
                ),
                //! Widget - Arco Slider - Maketplace
                SummaryTabSummaryCircularSliderPercentageWidget(
                  height: baseHeightCirSlid,
                  width: baseWidthCirSlid,
                  percentage: 60,
                  trackColor: AppColors.tenth,
                  progressBarColor1: AppColors.cirlceSlider4,
                  progressBarColor2: AppColors.cirlceSliderS4,
                  title: 'Vólumen',
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}
