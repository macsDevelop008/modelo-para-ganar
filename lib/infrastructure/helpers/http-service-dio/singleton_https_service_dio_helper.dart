import 'package:dio/dio.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';

/// Provee a instancia unica de la librería Dio
class SingletonHttpsServiceDioHelper {
  late Dio dio;

  static SingletonHttpsServiceDioHelper? _instancia;

  SingletonHttpsServiceDioHelper._internal();

  static SingletonHttpsServiceDioHelper getInstance() {
    if (_instancia == null) {
      _instancia = SingletonHttpsServiceDioHelper._internal();
      _instancia!._initDio();
    }

    return _instancia!;
  }

  /// Inicializa la librería Dio
  void _initDio() {
    final options = BaseOptions(
      baseUrl: EnvironmentVariables.urlDevelop, // Se pone url base
      connectTimeout: const Duration(seconds: 25),
      receiveTimeout: const Duration(seconds: 25),
    );

    dio = Dio(options);
  }
}
