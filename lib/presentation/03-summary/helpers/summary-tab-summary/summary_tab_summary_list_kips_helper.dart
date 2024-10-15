import 'package:modelo_para_ganar/infrastructure/infrastructure.dart';

Future<void> listKips() async {
  // Delay UX
  await Future.delayed(const Duration(seconds: 1));

  // Consumir peticion
  final datasource = HttpServiceDioDatasourceImpl();
  final repository = HttpServiceRepositoryImpl(datasource: datasource);
  final result = await repository.listKPIsByIdentificationUser();

  // Si no se generó error en la peticion

  if (result.$1 && result.$2 != null) {
    for (var element in result.$2!) {}
  }
  // Se generó error
  else {
    throw ('Error al cargar la información, vuelve a intentar');
  }
}
