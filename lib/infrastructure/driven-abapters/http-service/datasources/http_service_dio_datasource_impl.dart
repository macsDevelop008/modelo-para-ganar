import 'package:logger/web.dart';
import 'package:modelo_para_ganar/domain/domain.dart';
import 'package:modelo_para_ganar/infrastructure/infrastructure.dart';

class HttpServiceDioDatasourceImpl implements HttpServiceDatasource {
  final String logInEndPoint = 'v1/microsite/sessions';

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
}
