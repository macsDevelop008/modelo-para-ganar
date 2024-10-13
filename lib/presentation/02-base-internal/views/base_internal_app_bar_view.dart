import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/domain/domain.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

class BaseInternalAppBarView extends StatelessWidget {
  const BaseInternalAppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    // Tamaños
    final height = ResponsiveDimentions.height(context, .15);
    final width = ResponsiveDimentions.width(context, 1);

    return _baseAppBar(
        width,
        height,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //! Widget - Botón opciones
            BaseInternalOptionsButtonAppBarWidget(
              width: width * 0.11,
              height: height * 0.6,
              event: () {
                print('Opciones');
              },
            ),
            //! Widget - Info personal y droplist
            BaseInternalDataAppBarWidget(
              height: height * 0.6,
              width: width * 0.61,
              data: HomeAppBarDataEntity(
                  name: 'Miguel Angel Cuellar',
                  modelCode: '123456789',
                  modelsList: {
                    '1': 'Nuevo Test 1',
                    '2': 'Nuevo Test 2',
                    '3': 'Nuevo Test 3',
                    '4': 'Nuevo Test 4',
                  }),
              event: (String? value) {
                print(value);
              },
            ),
            //! Widget - Icono
            BaseInternalLogoAppBar(
              width: width * 0.2,
              height: height * 0.6,
              pathAssetImg: 'assets/images/logo_home.png',
            ),
          ],
        ));
  }

  /// AppBar base, espacio, degradado y colores
  Container _baseAppBar(double width, double height, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: width,
      height: height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              // Inicio y fin
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // Colores
              colors: [
                AppColors.eleventh,
                AppColors.tenth,
              ],
              stops: const [
                0.90,
                1.0
              ]),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(height * 0.2),
              bottomRight: Radius.circular(height * 0.2)),
          boxShadow: [
            BoxShadow(
                color: AppColors.thirteenth.withOpacity(0.5),
                blurRadius: height * 0.1,
                spreadRadius: height * 0.01)
          ]),
      child: child,
    );
  }
}
