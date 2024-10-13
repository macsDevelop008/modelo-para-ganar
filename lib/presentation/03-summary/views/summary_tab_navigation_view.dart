import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

class SummayTabNavigationView extends StatelessWidget {
  const SummayTabNavigationView(
      {super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    // Tamaño de los tabs
    final widthTab = width * 0.3;
    final heightTab = height * 0.7;

    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: _decoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //! Widget - Botón Resumen
          SummaryTabNavigationButtonWidget(
            height: heightTab,
            width: widthTab,
            isSelected: true,
            text: 'Resumen',
            event: () {},
          ),
          //! Widget - Botón Autoejecución
          SummaryTabNavigationButtonWidget(
            height: heightTab,
            width: widthTab,
            isSelected: false,
            text: 'Autoejecución',
            event: () {},
          ),
          //! Widget - Botón Radiografía
          SummaryTabNavigationButtonWidget(
            height: heightTab,
            width: widthTab,
            isSelected: false,
            text: 'Radiografía',
            event: () {},
          ),
        ],
      ),
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // Colores
          colors: [AppColors.first, AppColors.eighth],
          stops: const [0.01, 1.0],
        ),
        // Bordes redondeados
        borderRadius: BorderRadius.all(Radius.circular(width * 0.5)),
        // Sombra
        boxShadow: [
          // Sombra externa
          BoxShadow(
              color: AppColors.thirteenth.withOpacity(0.3),
              blurRadius: width * 0.01,
              spreadRadius: width * 0.001)
        ]);
  }
}
