import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

/// Esta Screen es la contenedora de las vistas
/// como resumen, bonification, etc.
/// Contiene todas las vistas que hagan parte del tab bar inferior
class BaseInternalScreen extends StatelessWidget {
  const BaseInternalScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
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
        key: KeysDrawOptionsGlobal.scaffoldDrawOptionsKey,
        drawer: const GlobalDrawerOptionsScreen(),
        body: SizedBox(
          height: ResponsiveDimentions.height(context, 1),
          width: ResponsiveDimentions.width(context, 1),
          child: Stack(
            alignment: Alignment.center,
            children: [
              //! Fondo
              const GlobalBackgrpundColorView(),
              //! Datos de la vista
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //! App Bar Personalizado
                  const BaseInternalAppBarView(),
                  //! Screen hijo
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  ResponsiveDimentions.width(context, 0.03)),
                          child: child)),
                  //! Tab Bar inferior - opciones
                  const BaseInternalButtonNavigationBarView(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
