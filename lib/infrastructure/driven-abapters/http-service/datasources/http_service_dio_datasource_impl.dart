import 'package:logger/web.dart';
import 'package:modelo_para_ganar/domain/domain.dart';
import 'package:modelo_para_ganar/infrastructure/infrastructure.dart';

class HttpServiceDioDatasourceImpl implements HttpServiceDatasource {
  // LogIn
  final String logInEndPoint = 'v1/microsite/sessions';
  // Campos de formulario de registro
  final String singupFormFieldsEndPoint = 'v1/forms/signup/info';
  // Crear participante
  final String createParticipantEndPoint = 'v1/participants';

  @override
  Future<(bool, String)> logIn(String user, String password) async {
    try {
      return await HttpsServiceDioLogInHelper()
          .logIn(logInEndPoint, user, password);
    } catch (e) {
      Logger().e(e);
      return (false, '');
    }
  }

  @override
  Future<(bool, List<FormFieldParticipantEntity>?)> singupFormFields(
      String apiKey, String compaing) async {
    try {
      final result = await HttpsServiceDioSingupFormFieldsHelper()
          .singupFormFields(singupFormFieldsEndPoint, apiKey, compaing);
      return result;
    } catch (e) {
      Logger().e(e);
      return (false, null);
    }
  }
}
