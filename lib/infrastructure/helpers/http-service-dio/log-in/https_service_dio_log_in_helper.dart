import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:modelo_para_ganar/configuration/constants/environment/environment_variables.dart';
import 'package:modelo_para_ganar/infrastructure/infrastructure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpsServiceDioLogInHelper {
  Future<(bool, String)> logIn(
      String endPoint, String user, String password) async {
    // Instancia Dio
    final dio = SingletonHttpsServiceDioHelper.getInstance().dio;

    // Instancia shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Cuerpo peticion
    final body = {
      'campaign': '4u',
      'participation': {
        'codigo-de-cliente': user,
        'password': password,
      }
    };

    //print('${dio.options.baseUrl}${endPoint}');
    final response = await dio.post(endPoint, data: body);

    // Transforma en mapa la data del response
    final data = jsonDecode(response.data) as Map;

    // Imprime información
    Logger().i(data);

    // Si es estado es 200
    if (response.statusCode == 200) {
      final ok = bool.parse(data['ok']);
      // Si el parámetro llegó en true
      if (ok) {
        // Si la llave token está en la respuesta
        if (data.containsKey('token')) {
          String token = data['token'].toString();
          // Almacenar token en el storage
          await prefs.setString(EnvironmentVariables.storageKeyToken, token);
          // Retorno satisfactorio
          return (true, 'token');
        } else {
          throw ('Error LogIn: No existe la el valor token en la respuesta');
        }
      } else {
        throw ('Error LogIn: Valor de la variable "ok" = $ok');
      }
    } else {
      throw ('Error LogIn: Estado de la petición: ${response.statusCode}');
    }
  }
}
