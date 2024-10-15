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

  static final String campaign =
      dotenv.get('COMPAIGN', fallback: 'not found enviroment-variable');

  static final String pushNotificationPermissions = dotenv.get(
      'STORAGE_KEY_PUSH_NOTIFICATION_PERMISSIONS',
      fallback: 'not found enviroment-variable');

  static final String userIdentification = dotenv.get(
      'STORAGE_KEY_USER_IDENTIFICATION',
      fallback: 'not found enviroment-variable');
}
