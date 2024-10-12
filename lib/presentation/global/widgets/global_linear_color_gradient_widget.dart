import 'package:flutter/material.dart';

class LinearColorGradientWidget extends StatelessWidget {
  const LinearColorGradientWidget(
      {super.key,
      required this.color1,
      required this.color2,
      required this.color3});

  final Color color1;
  final Color color2;
  final Color color3;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          color1,
          color2,
          color3,
        ],
        stops: const [
          0.05, // Primer color ocupa el 10%
          0.5, // Segundo color ocupa desde el 10% al 90%
          0.95, // Último color ocupa el 10% del gradiente (desde el 90% al 100%)
        ],
      )),
    );
  }
}
