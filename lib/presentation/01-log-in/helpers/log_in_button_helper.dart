// ignore_for_file: use_build_context_synchronously

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/infrastructure/infrastructure.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

/// Evento del botón de inicio de sesión
btnEventLogIn(
  BuildContext context,
  TextEditingController user,
  TextEditingController pass,
  WidgetRef ref,
) async {
  // Abrir modal de carga
  showLoadingModal(context);

  // Delay UX
  await Future.delayed(const Duration(milliseconds: 500));

  // Obtiene el valor de los terminos y condiciones del provider
  final acceptTermnsConditions = ref.read(riverpodLogInTermConditionsProvider);
  // Obtiene el valor de la privacidad del provider
  final acceptPrivacyNotice = ref.read(riverpodLogInPrivacyNoticeProvider);
  // Acceder al estado de las conexiones
  final List<ConnectivityResult> connectivityResult =
      await (Connectivity().checkConnectivity());

  // Verificar conexion a internet
  //TODO: Hacer un ping para completar verificacion acceso a la red
  if (connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi)) {
    // Verificar que usuario no esté vacio
    if (user.text != '') {
      // Verificar que contraseña no esté vacio
      if (pass.text != '') {
        // Verificar si se aceptó terminos y condiciones
        if (acceptTermnsConditions) {
          // Verificar si se aceptó el aviso de privacidad
          if (acceptPrivacyNotice) {
            // Consumir peticion LogIn
            final datasource = HttpServiceDioDatasourceImpl();
            final repository =
                HttpServiceRepositoryImpl(datasource: datasource);
            final serviceLogIn = await repository.logIn(user.text, pass.text);
            // Cerrar modal de carga
            closeModal(context);
            // Si el Login fue exitoso
            if (serviceLogIn.$1) {
              // Pasar a la pagina del resumen
              context.go('/${SummaryTabSummayScreen.name}');
            } else {
              // Modal indicando error en el LogIn
              showErrorModal(
                  context,
                  'Error al iniciar sesión, revisa las credenciales ingresadas.',
                  () {},
                  null);
            }
          } else {
            // Cerrar modal de carga
            closeModal(context);
            // Modal indicando que acepte ela viso de provacidad
            showWarningModal(
                context,
                'Acepta el aviso de privacidad para poder continuar.',
                () {},
                null);
          }
        } else {
          // Cerrar modal de carga
          closeModal(context);
          // Modal indicando que acepte terminos y condiciones
          showWarningModal(
              context,
              'Acepta los terminos y condiciones para poder continuar.',
              () {},
              null);
        }
      } else {
        // Cerrar modal de carga
        closeModal(context);
        // Modal indicando que ingrese una contraseña
        showWarningModal(
            context, 'Por favor ingresar una contraseña.', () {}, null);
      }
    } else {
      // Cerrar modal de carga
      closeModal(context);
      // Modal indicando que ingrese un usuario
      showWarningModal(context, 'Por favor ingresar un usuario.', () {}, null);
    }
  } else {
    // Cerrar modal de carga
    closeModal(context);
    // Modal indicando que no tiene internet
    showErrorModal(
        context, 'El dispositivo no tiene acceso a internet.', () {}, null);
  }
}
