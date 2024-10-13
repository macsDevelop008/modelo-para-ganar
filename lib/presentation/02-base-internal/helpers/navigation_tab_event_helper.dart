import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

Future<void> eventTab(BuildContext context, AppState myAppState,
    AppState currentAppState, WidgetRef ref) async {
  if (myAppState == currentAppState) return;

  // Obtener nombre de la pantalla objetivo
  String nameScreen = '';
  switch (myAppState) {
    case AppState.summary:
      nameScreen = SummaryTabSummayScreen.name;

      break;
    case AppState.bonus:
      nameScreen = BonusScreen.name;

      break;
    case AppState.selfExecuting:
      nameScreen = SelfExecutingScreen.name;

      break;
    default:
      nameScreen = '';
  }

  // Cambiar valor del provider que controla el estado de la app
  _changeAppStateProvider(ref, myAppState);

  // Cambiar de pantalla
  context.go('/$nameScreen');
}

void _changeAppStateProvider(WidgetRef ref, AppState newAppState) {
  ref.read(riverpodAppStateProvider.notifier).update((state) => newAppState);
}
