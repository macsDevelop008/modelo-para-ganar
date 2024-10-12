import 'package:flutter/material.dart';

class LogInLogoWidget extends StatelessWidget {
  const LogInLogoWidget({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.withOpacity(0),
      width: width,
      height: height,
      child: Image.asset('assets/images/modelo_ganar_logo.png'),
    );
  }
}
