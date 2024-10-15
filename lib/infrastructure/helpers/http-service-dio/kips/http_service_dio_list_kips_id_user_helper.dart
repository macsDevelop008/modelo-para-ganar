import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:modelo_para_ganar/configuration/constants/environment/environment_variables.dart';
import 'package:modelo_para_ganar/domain/domain.dart';
import 'package:modelo_para_ganar/infrastructure/infrastructure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpServiceDioListKipsIdUserHelper {
  Future<(bool, List<KipDataEntity>)> listKPIsByIdentificationUser(
      String endPoint) async {
    // Instancia Dio
    final dio = SingletonHttpsServiceDioHelper.getInstance().dio;

    // Instancia shared preferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final userIdentification =
        prefs.get(EnvironmentVariables.userIdentification);

    final apiKey = EnvironmentVariables.apiKey;
    final compaign = EnvironmentVariables.campaign;

    final body = {
      'api_key': apiKey,
      'campaign': compaign,
      'distinct_id': userIdentification,
      //TODO: data quemados
      'date_filter': {'sdate': '2024-08-01', 'edate': '2024-08-31'},
      '_type': 'External',
      'atype': 'avance_metas',
    };

    final response = await dio.post(endPoint, data: body);

    // Transforma en mapa la data del response
    final data = jsonDecode(response.data) as Map;

    // Imprime información
    Logger().i(data);

    // Si es estado es 200
    if (response.statusCode == 200) {
      // Toma el ultimo dato del array "entries"
      final listEntries = data['data']['entries'] as List;
      final lengthEntries = listEntries.length;
      final lastEntry = (listEntries[lengthEntries - 1] as Map)['data']
          as Map<String, dynamic>;
      // Resultado
      final result = await _parseData(lastEntry);
      return (true, result);
    } else {
      throw ('Error listKPIsByIdentificationUser: Estado de la petición: ${response.statusCode}');
    }
  }

  //! Retorna la lista de KIPs a mostrar en la view
  Future<List<KipDataEntity>> _parseData(Map<String, dynamic> data) async {
    Map<String, KipDataEntity> result = {};

    data.forEach((key, value) {
      // Convertir el valor a double o dejarlo como null si no es un número válido
      double? parsedValue = double.tryParse(value.toString());

      if (key.contains('meta')) {
        // Extraer el nombre eliminando el sufijo después de 'meta'.
        String nombre = key.split('_meta')[0].replaceAll('_', ' ');

        // Inicializar el objeto si no existe
        if (!result.containsKey(nombre)) {
          result[nombre] = KipDataEntity(name: nombre);
        }

        // Asignar valores a goalHectolitros y goalCartones
        if (key.contains('hectolitros')) {
          result[nombre]!.goalHectolitros = parsedValue?.toInt();
        } else if (key.contains('cartones')) {
          result[nombre]!.goalCartones = parsedValue?.toInt();
        }
      } else if (key.contains('avance')) {
        // Extraer el nombre como antes
        String nombre = key.split('_avance')[0].replaceAll('_', ' ');

        // Inicializar el objeto si no existe
        if (!result.containsKey(nombre)) {
          result[nombre] = KipDataEntity(name: nombre);
        }

        // Asignar valores a currentHectolitros y currentCartones
        if (key.contains('hectolitros')) {
          result[nombre]!.currentHectolitros = parsedValue?.toInt();
        } else if (key.contains('cartones')) {
          result[nombre]!.currentCartones = parsedValue?.toInt();
        }
      }
    });

    // Convertir el mapa a una lista
    return result.values.toList();
  }
}
