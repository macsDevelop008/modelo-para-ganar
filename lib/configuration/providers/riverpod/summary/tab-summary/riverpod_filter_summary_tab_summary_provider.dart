import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider que almacena el valor del filtro en resumen en el tab resumen
// De momento son 2 valores:
// 1 = Cartones
// 2 = Hectolitros
final reverpodFilterSummayTabSummaryProvider = StateProvider<String>((ref) {
  return '1';
});
