import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  static const String name = 'log-in-screen';

  @override
  Widget build(BuildContext context) {
    // Controladores TextField
    final controllerTextUser = TextEditingController();
    final controllerTextPass = TextEditingController();

    //TODO: eliminar
    controllerTextUser.text = '12222222';
    controllerTextPass.text = '123456789';

    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (didPop) {
        if (didPop) {
          debugPrint('PopScope: Se intentó hacer pop');
        }
        debugPrint('PopScope: No se puede hacer pop');
      },
      child: Scaffold(
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
                      Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //! Vista - Logo, titulo y subtitulo
                      const LogInInitialLogoTitleView(),
                      //! Vista - Inputs nombre usuario, contraseña y recuperar contraseña
                      LogInInputsUserView(
                        controllerTextUser: controllerTextUser,
                        controllerTextPass: controllerTextPass,
                      ),
                      //! Vista - Terminos condiciones
                      const LogInTermsConditionsView(),
                      //! Vista - Botones y ayuda
                      LogInButtonsHelpView(
                        controllerTextUser: controllerTextUser,
                        controllerTextPass: controllerTextPass,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
