// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openWhatsApp(
    BuildContext context, String phoneNumber, String message) async {
  // Mostrar modal de carga
  showLoadingModal(context);

  //Delay UX
  await Future.delayed(const Duration(seconds: 1));

  // Uri, url para abror wp y envíar msg
  final Uri whatsappUri = Uri.parse(
      "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}");

  // Verificar si se puede abrir la URL
  if (await canLaunchUrl(whatsappUri)) {
    await launchUrl(whatsappUri);
    // Cerrar modal de carga
    closeModal(context);
  } else {
    // Cerrar modal de carga
    closeModal(context);
    // Mostrar modal error
    showErrorModal(context,
        'Error al intentar abrir Whatsapp, vuelva a intentar.', () {}, null);
  }
}
