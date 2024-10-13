import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

/// Vista que contiene:
/// 1.  Logo
/// 2.  Titulo
/// 3.  Subtitulo
class LogInInitialLogoTitleView extends StatelessWidget {
  const LogInInitialLogoTitleView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Ancho y Alto
    final height = ResponsiveDimentions.height(context, 0.35);
    final width = ResponsiveDimentions.width(context, 1);

    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        color: Colors.red.withOpacity(0),
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //! Logo
            LogInLogoWidget(
              height: height * 0.6,
              width: width * 0.5,
            ),
            //! Titulo
            LogInTitleWidget(
              title: '¡Bienvenido/a Modelo Para Ganar!',
              size: height * 0.07,
            ),
            //! Subtitulo
            LogInSubtitleWidget(
              title: 'Ingresa tus datos:',
              size: height * 0.063,
              marginTop: height * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
