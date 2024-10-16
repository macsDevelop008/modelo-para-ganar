import 'package:modelo_para_ganar/domain/domain.dart';

class HttpServiceRepositoryImpl implements HttpServiceRepository {
  HttpServiceRepositoryImpl({required this.datasource});

  final HttpServiceDatasource datasource;

  @override
  Future<(bool, String)> logIn(String user, String password) async {
    return await datasource.logIn(user, password);
  }

  @override
  Future<(bool, List<FormFieldParticipantEntity>?)> singupFormFields() async {
    return await datasource.singupFormFields();
  }

  @override
  Future<(bool, String)> createParticipant(
      List<FormFieldParticipantEntity> data) async {
    return await datasource.createParticipant(data);
  }

  @override
  Future<(bool, List<KipDataEntity>?)> listKPIsByIdentificationUser() async {
    return await datasource.listKPIsByIdentificationUser();
  }
}
