import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

class BaseInternalButtonNavigationBarView extends ConsumerWidget {
  const BaseInternalButtonNavigationBarView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Provider del estado de la app
    final currentStateApp = ref.watch(riverpodAppStateProvider);

    // Conocer Plataforma IOS o Android
    final bool isIos = Platform.isIOS;

    // Tamaños
    final height = ResponsiveDimentions.height(context, isIos ? 0.1 : 0.075);
    final width = ResponsiveDimentions.width(context, 0.96);

    // Tamños de los tabs
    final heightTab = height * (isIos ? 0.58 : 0.7);
    final widthTab = width * 0.3;

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
            height: heightTab,
            width: widthTab,
            icon: Icons.monetization_on_outlined,
            text: 'Bonificación',
            event: () {
              eventTab(context, AppState.bonus, currentStateApp, ref);
            },
            isSelected: currentStateApp == AppState.bonus,
          ),
          //! Widget - Resumen
          BaseInternalBarNavigatorButtonWidget(
            height: heightTab,
            width: widthTab,
            icon: Icons.home_outlined,
            text: 'Resumen',
            event: () {
              eventTab(context, AppState.summary, currentStateApp, ref);
            },
            isSelected: currentStateApp == AppState.summary,
          ),
          //! Widget - Autoejecucion
          BaseInternalBarNavigatorButtonWidget(
            height: heightTab,
            width: widthTab,
            icon: Icons.image_outlined,
            text: 'Autoejecución',
            event: () {
              eventTab(context, AppState.selfExecuting, currentStateApp, ref);
            },
            isSelected: currentStateApp == AppState.selfExecuting,
          ),
        ],
      ),
    );
  }
}
