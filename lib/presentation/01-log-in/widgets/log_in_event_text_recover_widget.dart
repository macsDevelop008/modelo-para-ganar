import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';

/// Widget que contiene el texto con evento para
/// recuperar la contraseña
class LogInEventTextRecoverWidget extends StatelessWidget {
  const LogInEventTextRecoverWidget(
      {super.key,
      required this.text,
      required this.event,
      required this.height,
      required this.width});

  final String text;
  final VoidCallback event;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        event();
      },
      child: Container(
        width: width,
        height: height * 0.15,
        alignment: Alignment.centerRight,
        color: Colors.yellow.withOpacity(0),
        child: Text(
          text,
          style: TextStyle(
              color: AppColors.ninth,
              fontSize: height * 0.07,
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal),
        ),
      ),
    );
  }
}
