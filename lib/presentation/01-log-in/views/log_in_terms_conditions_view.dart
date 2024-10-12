import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

/// Vista que contiene los terminos y condiciones
class LogInTermsConditionsView extends StatelessWidget {
  const LogInTermsConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Ancho y Alto
    final height = ResponsiveDimentions.height(context, 0.08);
    final width = ResponsiveDimentions.width(context, 1);

    return Container(
      alignment: Alignment.center,
      color: Colors.red.withOpacity(0),
      padding: EdgeInsets.only(left: width * 0.04),
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //! Widget - Termino y condicion
          LogInCheckBoxTextWidget(
            width: width,
            height: height,
            text: 'He leído y acepto ',
            textEvent: 'Términos y Condiciones',
            eventText: () {
              print('envento terminos y condiciones');
            },
            eventCheckBox: (value) {
              print(value);
            },
          ),
          //! Espacio
          SizedBox(
            height: height * 0.04,
          ),
          //! Widget - Aviso prvacidad
          LogInCheckBoxTextWidget(
            width: width,
            height: height,
            text: 'He leído y acepto el ',
            textEvent: 'Aviso de privacidad',
            eventText: () {
              print('envento terminos y condiciones');
            },
            eventCheckBox: (value) {
              print(value);
            },
          ),
        ],
      ),
    );
  }
}
