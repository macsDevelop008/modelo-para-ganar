import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modelo_para_ganar/configuration/enums/enum_app_state.dart';

final riverpodAppStateProvider = StateProvider<AppState>((ref) {
  // TODO: ajustar - test
  return AppState.summary;
});
