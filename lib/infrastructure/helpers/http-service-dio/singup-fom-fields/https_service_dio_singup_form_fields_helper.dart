import 'dart:convert';

import 'package:logger/web.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/domain/domain.dart';
import 'package:modelo_para_ganar/infrastructure/infrastructure.dart';

class HttpsServiceDioSingupFormFieldsHelper {
  Future<(bool, List<FormFieldParticipantEntity>?)> singupFormFields(
      String endPoint, String apiKey, String compaing) async {
    // Instancia Dio
    final dio = SingletonHttpsServiceDioHelper.getInstance().dio;

    //Api Key de las variables de entorno
    final apiKey = EnvironmentVariables.apiKey;

    // Cuerpo peticion
    final body = {
      'api_key': apiKey,
      'campaign': '4u',
    };

    // Se hace la peticion
    final response = await dio.post(endPoint, data: body);

    // Transforma en mapa la data del response
    final data = jsonDecode(response.data) as Map;

    // Imprime información
    Logger().i(data);

    // Si es estado es 200
    if (response.statusCode == 200) {
      return (true, _getListForms(data['object']['fields']));
    } else {
      throw ('Error singupFormFields: Estado de la petición: ${response.statusCode}');
    }
  }

  /// Transforma en objeto los espacios requeridos para el registro del participante
  List<FormFieldParticipantEntity> _getListForms(List data) {
    List<FormFieldParticipantEntity> result = [];

    for (var element in data) {
      result.add(FormFieldParticipantEntity(
          typeValue: element['type_value'].toString(),
          name: element['name'],
          isRequired: element['required_field'],
          label: element['label']));
    }
    return result;
  }
}
