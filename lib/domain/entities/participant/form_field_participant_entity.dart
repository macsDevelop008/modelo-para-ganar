//! Cada objeto representa un espacio del formulario para poder registrar un participante

class FormFieldParticipantEntity {
  String typeValue;
  String
      name; // Con este name se envía como parámetro en la petición de registro
  bool
      isRequired; // Si es un parámetro requerido o no en la petición del registro

  FormFieldParticipantEntity({
    required this.typeValue,
    required this.name,
    required this.isRequired,
  });

  @override
  String toString() {
    return 'FormFieldParticipantEntity(typeValue: $typeValue, name: $name, isRequired: $isRequired)';
  }
}
