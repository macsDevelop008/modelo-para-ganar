import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

/// Contiene lo siguiente:
/// 1. Titulo e input text del número de usurio
/// 2. Titulo e input text de la contraseña
/// 3. Text Button para recuperar contraseña
class LogInInputsUserView extends StatelessWidget {
  const LogInInputsUserView(
      {super.key,
      required this.controllerTextUser,
      required this.controllerTextPass});

  // Controladores TextField usuario y contraseña
  final TextEditingController controllerTextUser;
  final TextEditingController controllerTextPass;

  @override
  Widget build(BuildContext context) {
    // Ancho y Alto
    final height = ResponsiveDimentions.height(context, 0.24);
    final width = ResponsiveDimentions.width(context, 1);

    return Container(
      alignment: Alignment.center,
      color: Colors.pink.withOpacity(0),
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //! Widget - Input usuario
          LogInTitleInputTextWidget(
            title: 'Número de usuario *',
            width: width * 0.85,
            height: height * 0.4,
            hintText: 'Número de usuario *',
            controller: controllerTextUser,
            obscureText: false,
          ),
          //! Widget - Input contraseña
          LogInTitleInputTextWidget(
            title: 'Contraseña *',
            width: width * 0.85,
            height: height * 0.4,
            hintText: 'Contraseña *',
            controller: controllerTextPass,
            obscureText: true,
          ),
          //! Widget - Recuperar contraseña
          LogInEventTextRecoverWidget(
            text: '¿Olvidaste tu contraseña?',
            event: () {
              print('Evento olvidado contraseña');
            },
            height: height,
            width: width * 0.85,
          ),
        ],
      ),
    );
  }
}
