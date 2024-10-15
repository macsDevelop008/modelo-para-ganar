import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

class GlobalDrawerOptionsScreen extends StatelessWidget {
  const GlobalDrawerOptionsScreen({super.key});

  /// Decoración del contenedor
  BoxDecoration _decoration(double height) {
    return BoxDecoration(
        // Sombra
        boxShadow: [
          BoxShadow(
              color: AppColors.thirteenth,
              blurRadius: height * 0.01,
              spreadRadius: height * 0.005)
        ],
        // Gradiente
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.fourth, AppColors.third, AppColors.fourth]));
  }

  @override
  Widget build(BuildContext context) {
    // Tamaños
    final double height = ResponsiveDimentions.height(context, 1);
    final double width = ResponsiveDimentions.width(context, .5);

    return Container(
      height: height,
      width: width,
      decoration: _decoration(height),
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //! Espacio
          SizedBox(
            height: height * 0.02,
          ),
          //! Logo
          SizedBox(
            child: Image.asset(
              'assets/images/logo_home.png',
              width: width * 0.8,
            ),
          ),
          //! Espacio
          const Expanded(child: SizedBox()),
          //! Boton crear participante
          SizedBox(
              width: width * 0.8,
              child: ElevatedButton(
                  onPressed: () {
                    showDialogCreateParticipant(context);
                  },
                  child: Text(
                    'Crear Participante',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w700,
                        color: AppColors.third,
                        fontSize: width * 0.08),
                  ))),
          //! Espacio
          SizedBox(
            height: height * 0.01,
          ),
          //! Boton cerrar sesión
          SizedBox(
              width: width * 0.8,
              child: ElevatedButton(
                  onPressed: () {
                    logOut(context);
                  },
                  child: Text(
                    'Cerrar Sesión',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w700,
                        color: AppColors.third,
                        fontSize: width * 0.08),
                  ))), //! Espacio
          SizedBox(
            height: height * 0.02,
          ),
        ],
      )),
    );
  }
}
