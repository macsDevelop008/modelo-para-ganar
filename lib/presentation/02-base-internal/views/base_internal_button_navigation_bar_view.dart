import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

class BaseInternalButtonNavigationBarView extends StatelessWidget {
  const BaseInternalButtonNavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    //Conocer Plataforma IOS o Android
    final bool isIos = Platform.isIOS;

    // Tamaños
    final height = ResponsiveDimentions.height(context, isIos ? 0.1 : 0.075);
    final width = ResponsiveDimentions.width(context, 0.96);

    return Container(
      alignment: isIos ? Alignment.topCenter : Alignment.center,
      height: height,
      width: width,
      padding: EdgeInsets.only(top: height * 0.1),
      decoration: BoxDecoration(
          color: AppColors.seventh,
          borderRadius: BorderRadius.all(Radius.circular(height * 0.4))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //! Widget - Bonificacion
          BaseInternalBarNavigatorButtonWidget(
            height: height * (isIos ? 0.58 : 0.7),
            width: width * 0.3,
            icon: Icons.monetization_on_outlined,
            text: 'Bonificación',
            event: () {
              print('Ir a bonificacion');
            },
            isSelected: false,
          ),
          //! Widget - Resumen
          BaseInternalBarNavigatorButtonWidget(
            height: height * (isIos ? 0.58 : 0.7),
            width: width * 0.3,
            icon: Icons.home_outlined,
            text: 'Resumen',
            event: () {
              print('Ir a resumen');
            },
            isSelected: true,
          ),
          //! Widget - Autoejecucion
          BaseInternalBarNavigatorButtonWidget(
            height: height * (isIos ? 0.58 : 0.7),
            width: width * 0.3,
            icon: Icons.image_outlined,
            text: 'Autoejecución',
            event: () {
              print('Ir a Autoejecución');
            },
            isSelected: false,
          ),
        ],
      ),
    );
  }
}
