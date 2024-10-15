import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:flutter/material.dart';

class SummaryTabSummaryCircularSliderPercentageWidget extends StatelessWidget {
  const SummaryTabSummaryCircularSliderPercentageWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.percentage,
      required this.trackColor,
      required this.progressBarColor1,
      required this.progressBarColor2,
      required this.title});

  final double height;
  final double width;
  final String title;
  final double percentage;
  final Color trackColor; // Color del slider por cargar
  final Color progressBarColor1; // Color uno del slider cargado
  final Color progressBarColor2; // Color dos del slider cargado
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: height * 0.08),
      color: Colors.orange.withOpacity(0),
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //! Slider circular con texto porcentaje
          _circularSliderPercentage(),

          //! Titulo inferior
          Expanded(
            child: Container(
              color: Colors.red.withOpacity(0),
              margin: EdgeInsets.only(top: height * 0.03),
              alignment: Alignment.center,
              child: Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.seventh,
                    fontFamily: 'NotoSans',
                    fontSize: height * 0.11,
                    fontWeight: FontWeight.w700),
              ),
            ),
          )
        ],
      ),
    );
  }

  SleekCircularSlider _circularSliderPercentage() {
    return SleekCircularSlider(
      min: 0,
      max: 100,
      initialValue: percentage,
      appearance: CircularSliderAppearance(
          angleRange: 360,
          infoProperties: InfoProperties(
              // Texto porcentaje
              mainLabelStyle: TextStyle(
                  color: AppColors.seventh,
                  fontFamily: 'NotoSans',
                  fontSize: height * 0.17,
                  fontWeight: FontWeight.w700)),
          // Tamaños
          // Tamaño general
          size: height * 0.65,
          customWidths: CustomSliderWidths(
              // Tamaño slider no seleccionado
              trackWidth: height * 0.04,
              // Tamaño slider seleccionado
              progressBarWidth: height * 0.08,
              // Tamaño circulo
              handlerSize: 0,
              // Tamaño sombra
              shadowWidth: height * 0.14),
          customColors: CustomSliderColors(
              // Color slider NO seleccionado
              trackColor: trackColor.withOpacity(0.3),
              // Color slider seleccionado
              progressBarColors: [progressBarColor1, progressBarColor2],
              // Color sombra
              shadowColor: progressBarColor2)),
    );
  }
}
