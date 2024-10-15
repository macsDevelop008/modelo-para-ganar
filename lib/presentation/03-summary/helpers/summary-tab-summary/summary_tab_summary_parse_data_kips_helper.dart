import 'dart:math';

import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';

//! Letra inicial de cada palabra en Mayusculas
String parseName(String current) {
  return current
      .split(' ')
      .where((word) => word.isNotEmpty) // Filtrar palabras vacías
      .map((word) {
    if (word.length > 0 && word[0].contains(RegExp(r'[a-zA-Z]'))) {
      // Solo capitalizar si la primera letra es una letra
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    } else {
      // Si no, retornar la "palabra" tal como está
      return word;
    }
  }).join(' ');
}

//! Color aleatorio para el slider circular
/// Primer color para el slider
/// Sgundo color para la sombra del slider
(Color, Color) randomColorsCircleSlider() {
  final random = Random();
  int randomNumber =
      random.nextInt(4) + 1; // Genera un número entre 0 y 3, y luego le suma 1

  // Seleccionar colores segun número random
  switch (randomNumber) {
    case 1:
      return (AppColors.cirlceSlider1, AppColors.cirlceSliderS1);
    case 2:
      return (AppColors.cirlceSlider2, AppColors.cirlceSliderS2);
    case 3:
      return (AppColors.cirlceSlider3, AppColors.cirlceSliderS3);
    case 4:
      return (AppColors.cirlceSlider4, AppColors.cirlceSliderS4);
    default:
      return (AppColors.cirlceSlider1, AppColors.cirlceSliderS1);
  }
}
