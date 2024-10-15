import 'package:logger/web.dart';
import 'package:modelo_para_ganar/configuration/constants/environment/environment_variables.dart';
import 'package:modelo_para_ganar/domain/domain.dart';
import 'package:modelo_para_ganar/infrastructure/infrastructure.dart';

class HttpServiceDioDatasourceImpl implements HttpServiceDatasource {
  // LogIn
  final String logInEndPoint = 'v1/microsite/sessions';
  // Campos de formulario de registro
  final String singupFormFieldsEndPoint = 'v1/forms/signup/info';
  // Crear participante
  final String createParticipantEndPoint = 'v1/participants';
  // Obtener data de los KPIs
  final String kipsInformation = 'v1/entries/index';

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
  Future<(bool, List<FormFieldParticipantEntity>?)> singupFormFields() async {
    try {
      final result = await HttpsServiceDioSingupFormFieldsHelper()
          .singupFormFields(singupFormFieldsEndPoint,
              EnvironmentVariables.apiKey, EnvironmentVariables.campaign);
      return result;
    } catch (e) {
      Logger().e(e);
      return (false, null);
    }
  }

  @override
  Future<(bool, String)> createParticipant(
      List<FormFieldParticipantEntity> data) async {
    try {
      return await HttpServiceDioCreateParticipantHelper()
          .createParticipant(createParticipantEndPoint, data);
    } catch (e) {
      Logger().e(e);
      return (false, '');
    }
  }

  @override
  Future<(bool, List<KipDataEntity>?)> listKPIsByIdentificationUser() async {
    try {
      return await HttpServiceDioListKipsIdUserHelper()
          .listKPIsByIdentificationUser(kipsInformation);
    } catch (e) {
      Logger().e(e);
      return (false, null);
    }
  }
}
