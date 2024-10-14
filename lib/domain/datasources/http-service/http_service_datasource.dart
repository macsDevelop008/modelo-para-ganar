abstract class HttpServiceDatasource {
  //! Realizar la peti. del logIn
  /// [parameter]user, Usuario ingresado
  /// [parameter]password, Contraseña ingresada
  /// [return] bool = Si efectuó la lógica si errores
  /// [return] String = Token de la api
  Future<(bool, String)> logIn(String user, String password);
}
