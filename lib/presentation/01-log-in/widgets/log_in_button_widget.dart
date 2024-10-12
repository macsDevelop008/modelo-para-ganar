import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';

class LogInButtonWidget extends StatelessWidget {
  const LogInButtonWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.btnColor1,
      required this.btnColor2,
      required this.shadowColor,
      required this.text,
      required this.textColor,
      this.borderColor,
      required this.event});

  final double width;
  final double height;
  final Color btnColor1;
  final Color btnColor2;
  final Color? borderColor;
  final Color shadowColor;
  final String text;
  final Color textColor;
  final VoidCallback event;

  @override
  Widget build(BuildContext context) {
    return
        // Base con colores y formas del botón
        Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
          // Borde redondeado
          borderRadius: BorderRadius.all(Radius.circular(width * 0.1)),
          // Borde
          border: Border.all(
              color: borderColor ?? Colors.transparent, width: height * 0.01),
          // Sombra
          boxShadow: [
            BoxShadow(
                offset: Offset(0, height * 0.05),
                color: shadowColor,
                blurRadius: height * 0.1,
                spreadRadius: 0.01)
          ],
          // Gradiente
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [btnColor1, btnColor2])),
      child:
          // Recorte con la misma forma de la base del botón
          ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(width * 0.1)),
        child:
            // Efecto y evento botón recortado con la forma del botón
            RawMaterialButton(
          onPressed: () {
            event();
          },
          highlightColor: AppColors.tenth, // Color efecto presionado
          splashColor: AppColors.tenth,
          child:
              // Mismo tamaño de la base del botón para el efecto del Material
              Container(
            alignment: Alignment.center,
            width: width,
            height: height,
            // Texto del boton
            child: Text(
              text,
              style: TextStyle(
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w700,
                  color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
