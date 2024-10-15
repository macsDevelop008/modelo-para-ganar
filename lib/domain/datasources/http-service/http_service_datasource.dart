import 'package:modelo_para_ganar/domain/domain.dart';

abstract class HttpServiceDatasource {
  //! Realizar la peti. del logIn
  /// [parameter]user, Usuario ingresado
  /// [parameter]password, Contraseña ingresada
  /// [return] bool = Si efectuó la lógica si errores
  /// [return] String = Token de la api
  Future<(bool, String)> logIn(String user, String password);

  //! Realizar la peti. de los espacio de formulario para crear participante
  /// [parameter]apiKey, api key proporcionada
  /// [parameter]compaing, campaña
  /// [return] bool = Si efectuó la lógica sin errores
  /// [return] List<FormFieldParticipantEntity> = Listado de data requerida para el registro
  /// del usuario
  Future<(bool, List<FormFieldParticipantEntity>?)> singupFormFields();

  //! Realizar la peti. de la creación de participante
  /// [parameter]data, data del nuevo participante a registrar
  /// [return] bool = Si efectuó la lógica si errores
  /// [return] String = codigo de respuesta
  Future<(bool, String)> createParticipant(
      List<FormFieldParticipantEntity> data);
}
