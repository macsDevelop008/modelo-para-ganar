import 'dart:ui';

import 'package:flutter/material.dart';

class GlobalCicleColorGradientBlurWidget extends StatelessWidget {
  const GlobalCicleColorGradientBlurWidget(
      {super.key,
      required this.size,
      required this.color1,
      required this.color2});

  final double size;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        //! Circulo gradiente
        Container(
          alignment: Alignment.center,
          width: size,
          height: size,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [color1.withOpacity(0.4), color2.withOpacity(0.4)])),
        ),

        //! Bloor
        ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 11, sigmaY: 11),
            child: Container(
              width: size + size * 0.1,
              height: size + size * 0.1,
              decoration: BoxDecoration(
                  color: Colors.transparent, shape: BoxShape.circle),
            ),
          ),
        ),
      ],
    );
  }
}
