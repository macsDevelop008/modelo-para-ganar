import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

/// Vista que contiene
/// 1. Botón iniciar sesión
/// 2. Botón entrar como supervisor
/// 3. TextButton ayuda wp
class LogInButtonsHelpView extends StatelessWidget {
  const LogInButtonsHelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Tamaño
          final height = constraints.maxHeight;
          final width = constraints.maxWidth;

          return Container(
            alignment: Alignment.center,
            color: Colors.blue.withOpacity(0),
            //padding: EdgeInsets.only(left: width * 0.04),
            height: height,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //! Widget - Boton iniciar sesión
                LogInButtonWidget(
                  width: width * 0.95,
                  height: height * 0.18,
                  btnColor1: AppColors.tenth,
                  btnColor2: AppColors.eleventh,
                  shadowColor: AppColors.first,
                  text: 'Iniciar sesión',
                  textColor: AppColors.eighth,
                  event: () {
                    print('evento');
                  },
                  textSize: height * 0.08,
                ),
                //! Espacio
                SizedBox(
                  height: height * 0.08,
                ),
                //! Widget - Boton entrar supervisor
                LogInButtonWidget(
                  width: width * 0.95,
                  height: height * 0.18,
                  btnColor1: AppColors.third,
                  btnColor2: AppColors.first,
                  shadowColor: AppColors.first,
                  text: 'Entrar como supervisor',
                  textColor: AppColors.seventh,
                  borderColor: AppColors.tenth,
                  event: () {
                    print('evento');
                  },
                  textSize: height * 0.08,
                ),
                //! Widget - Texto button ayuda
                LogInEventTextIconWidget(
                  event: () {
                    print('ayuda whats');
                  },
                  width: width,
                  height: height * 0.3,
                  text: '¿Necesitas ayuda con tu registro?',
                  icon: FontAwesomeIcons.whatsapp,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
