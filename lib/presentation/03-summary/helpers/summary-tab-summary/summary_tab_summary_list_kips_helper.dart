import 'package:modelo_para_ganar/domain/domain.dart';
import 'package:modelo_para_ganar/infrastructure/infrastructure.dart';

Future<List<KipDataEntity>> listKips(String valueFilter) async {
  // Delay UX
  await Future.delayed(const Duration(seconds: 1));

  // Consumir peticion
  final datasource = HttpServiceDioDatasourceImpl();
  final repository = HttpServiceRepositoryImpl(datasource: datasource);
  final result = await repository.listKPIsByIdentificationUser();

  // Si no se generó error en la peticion
  if (result.$1 && result.$2 != null) {
    List<KipDataEntity> filterResult = [];
    List<KipDataEntity> dataBase = result.$2!;

    // Filtro de datos solo para los que tienen meta, segun cartones o hectolitros
    for (var element in dataBase) {
      // Si el filtro es 1, cartones
      if (valueFilter == '1') {
        // Si tiene una meta en cartones diferente de null y maor 0
        if (element.goalCartones != null && element.goalCartones! > 0) {
          filterResult.add(element);
        }
      }

      // Si el filtro es 2, hectolitros
      if (valueFilter == '2') {
        // Si tiene una meta en hectolitros diferente de de null y maor 0
        if (element.goalHectolitros != null && element.goalHectolitros! > 0) {
          filterResult.add(element);
        }
      }
    }

    return filterResult;
  }
  // Se generó error
  else {
    throw ('Error al cargar la información, vuelve a intentar');
  }
}
