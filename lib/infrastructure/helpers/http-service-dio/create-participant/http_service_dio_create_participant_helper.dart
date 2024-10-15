import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/web.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/domain/domain.dart';
import 'package:modelo_para_ganar/infrastructure/infrastructure.dart';

class HttpServiceDioCreateParticipantHelper {
  Future<(bool, String)> createParticipant(
      String endPoint, List<FormFieldParticipantEntity> data) async {
    // Instancia Dio
    final dio = SingletonHttpsServiceDioHelper.getInstance().dio;

    // Parámetros
    Map body = {};
    final properties = {
      for (var item in data)
        item.name: (item.value is String) ? item.value : item.value.toString()
    };
    // Agregar campaña y api key
    body['api_key'] = EnvironmentVariables.apiKey;
    body['campaign'] = EnvironmentVariables.campaign;
    body['properties'] = properties;

    try {
      // Se hace la petición
      final response = await dio.post(endPoint, data: body);

      // Transforma en mapa la data del response
      final dataR = jsonDecode(response.data) as Map;

      // Imprime información
      Logger().i(dataR);

      // Si el estado es 200
      if (response.statusCode == 200) {
        return (true, '200');
      } else {
        // En caso de otros estados, lanza un error personalizado
        throw Exception('Estado inesperado: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // Si el estado es 422
      if (e.response?.statusCode == 422) {
        final dataR = jsonDecode(e.response?.data) as Map;
        return (true, dataR['code_error'].toString());
      } else {
        // Si es otro tipo de error
        throw Exception('Error inesperado en la solicitud: ${e.message}');
      }
    } catch (e) {
      //cualquier otro tipo de error
      throw Exception('Error inesperado: $e');
    }
  }
}
