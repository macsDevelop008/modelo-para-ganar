import 'package:flutter/material.dart';

class BaseInternalLogoAppBar extends StatelessWidget {
  const BaseInternalLogoAppBar(
      {super.key,
      required this.width,
      required this.height,
      required this.pathAssetImg});

  final double width;
  final double height;
  final String pathAssetImg;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.red.withOpacity(0),
      width: width,
      height: height,
      child: Image.asset(
        pathAssetImg,
        fit: BoxFit.fill,
      ),
    );
  }
}
