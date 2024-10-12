import 'package:flutter/material.dart';

class ResponsiveDimentions {
  static double height(BuildContext context, double scale) {
    return MediaQuery.sizeOf(context).height * scale;
  }

  static double width(BuildContext context, double scale) {
    return MediaQuery.sizeOf(context).width * scale;
  }
}
