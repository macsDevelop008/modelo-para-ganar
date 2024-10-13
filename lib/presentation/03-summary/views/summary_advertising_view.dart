import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

class SummaryAdvertisingView extends StatelessWidget {
  const SummaryAdvertisingView(
      {super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.withOpacity(0),
      width: width,
      height: height * 0.25,
      child:
          //! Imagen
          SummaryAdvertisingImageWidget(
        height: height * 0.01,
        width: width * 0.01,
        pathImg: 'assets/images/banner_home.png',
      ),
    );
  }
}
