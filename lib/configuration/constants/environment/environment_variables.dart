import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentVariables {
  static final String apiKey =
      dotenv.get('API_KEY', fallback: 'not found enviroment-variable');

  static final String urlProduction =
      dotenv.get('URL_PRODUCTION', fallback: 'not found enviroment-variable');

  static final String urlDevelop =
      dotenv.get('URL_DEVELOP', fallback: 'not found enviroment-variable');

  static final String storageKeyToken = dotenv.get('STORAGE_KEY_TOKEN',
      fallback: 'not found enviroment-variable');

  static final String phoneNumberWpTest =
      dotenv.get('WP_NUMBER_TEST', fallback: 'not found enviroment-variable');
}
