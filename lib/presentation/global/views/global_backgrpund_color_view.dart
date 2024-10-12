import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

/// Backgrpund con gradiente y colores extra
class GlobalBackgrpundColorView extends StatelessWidget {
  const GlobalBackgrpundColorView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = ResponsiveDimentions.width(context, 1);
    final height = ResponsiveDimentions.height(context, 1);
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          //! Gradiente linear
          LinearColorGradientWidget(
            color1: AppColors.first,
            color2: AppColors.third,
            color3: AppColors.second,
          ),
          //! Esfera con blur
          /*Positioned(
            bottom: height * -0.5,
            right: width * -0.5,
            child: CicleColorGradientBlurWidget(
              size: width * 0.9,
              color1: AppColors.fourth,
              color2: AppColors.third,
            ),
          ),*/
        ],
      ),
    );
  }
}
