import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modelo_para_ganar/domain/domain.dart';
import 'package:modelo_para_ganar/infrastructure/infrastructure.dart';

import '../../helpers/http_service_test_helper.dart';

void main() {
  setUp(() async {
    // Inicializar variables de entorno
    await dotenv.load(fileName: ".env");
  });
  // Datasource
  final datasource = HttpServiceDioDatasourceImpl();
  // Repository
  final repository = HttpServiceRepositoryImpl(datasource: datasource);

  // Registrar participante Satisfactorio
  test(
    'isSuccessCreateParticipant',
    () async {
      final result = await repository.createParticipant([
        // Emular listado de datos requeridos para crear un participante, ya con el dato ingresado
        // Se emulan solo los basicos requeridos
        FormFieldParticipantEntity(
            typeValue: 'String',
            name: 'nombre-completo',
            isRequired: true,
            label: 'Nombre',
            value: 'Pepeito Perez'),
        FormFieldParticipantEntity(
            typeValue: 'String',
            name: 'password',
            isRequired: true,
            label: 'Contraseña',
            value: 'sjdfb43ji4bg'),
        FormFieldParticipantEntity(
            typeValue: 'String',
            name: 'codigo-de-cliente',
            isRequired: true,
            label: 'id',
            value: generateRandomIdentification(8)),
        FormFieldParticipantEntity(
            typeValue: 'email',
            name: 'email',
            isRequired: true,
            label: 'email*',
            value: generateRandomEmail()),
      ]);
      final resul1 = result.$1;

      expect(resul1, true);
    },
  );

  // Intetar Registrar participante ya existente
  test(
    'alreadyExistCreateParticipant',
    () async {
      final result = await repository.createParticipant([
        // Emular listado de datos requeridos para crear un participante, ya con el dato ingresado
        // Se emulan solo los basicos requeridos
        FormFieldParticipantEntity(
            typeValue: 'String',
            name: 'nombre-completo',
            isRequired: true,
            label: 'Nombre',
            value: 'Miguel Cuellar'),
        FormFieldParticipantEntity(
            typeValue: 'String',
            name: 'codigo-de-cliente',
            isRequired: true,
            label: 'id',
            value: '12222222'),
        FormFieldParticipantEntity(
            typeValue: 'String',
            name: 'password',
            isRequired: true,
            label: 'Contraseña',
            value: 'sjdfb43ji4bg'),
        FormFieldParticipantEntity(
            typeValue: 'email',
            name: 'email',
            isRequired: true,
            label: 'email*',
            value: 'macsdevel008@gmail.com'),
      ]);
      final resul1 = result.$1;
      final resul2 = result.$2;

      // India que si se hizo la peticion
      expect(resul1, true);
      // Código que indica que ya existe el id de usuario o su email
      expect(resul2 == '21', true);
    },
  );
}
