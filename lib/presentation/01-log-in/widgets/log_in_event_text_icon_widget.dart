import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';

class LogInEventTextIconWidget extends StatelessWidget {
  const LogInEventTextIconWidget(
      {super.key,
      required this.event,
      required this.width,
      required this.height,
      required this.text,
      required this.icon});

  final VoidCallback event;
  final double width;
  final double height;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      color: Colors.yellow.withOpacity(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //! Texto
          GestureDetector(
            onTap: () {
              event();
            },
            child: Text(
              text,
              style: TextStyle(
                  color: AppColors.ninth,
                  fontSize: height * 0.25,
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal),
            ),
          ),
          //! Espacio
          SizedBox(
            width: width * 0.03,
          ),
          //! Icono
          FaIcon(icon, size: height * 0.3, color: AppColors.ninth)
        ],
      ),
    );
  }
}
