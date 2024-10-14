import 'package:modelo_para_ganar/domain/domain.dart';

class HttpServiceRepositoryImpl implements HttpServiceRepository {
  HttpServiceRepositoryImpl({required this.datasource});

  final HttpServiceDatasource datasource;

  @override
  Future<(bool, String)> logIn(String user, String password) async {
    return await datasource.logIn(user, password);
  }

  @override
  Future<(bool, List<FormFieldParticipantEntity>?)> singupFormFields(
      String apiKey, String compaing) async {
    return await datasource.singupFormFields(apiKey, compaing);
  }
}
