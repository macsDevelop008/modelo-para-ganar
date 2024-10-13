import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  static const String name = 'log-in-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: ResponsiveDimentions.height(context, 1),
          width: ResponsiveDimentions.width(context, 1),
          child: Stack(
            alignment: Alignment.center,
            children: [
              //! Fondo
              const GlobalBackgrpundColorView(),
              //! Padding de los componentes
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveDimentions.width(context, 0.05)),
                child: //! Componentes de la pantalla
                    const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //! Vista - Logo, titulo y subtitulo
                    LogInInitialLogoTitleView(),
                    //! Vista - Inputs nombre usuario, contraseña y recuperar contraseña
                    LogInInputsUserView(),
                    //! Vista - Terminos condiciones
                    LogInTermsConditionsView(),
                    //! Vista - Botones y ayuda
                    LogInButtonsHelpView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
