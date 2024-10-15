//! Cada objeto representa un espacio del formulario para poder registrar un participante

class FormFieldParticipantEntity {
  String typeValue;
  String
      name; // Con este name se envía como parámetro en la petición de registro
  String label; // Nombre a mostrar en pantalla en el form
  bool
      isRequired; // Si es un parámetro requerido o no en la petición del registro
  dynamic value; // Valor asignado despues de la interacción con el usuario

  FormFieldParticipantEntity(
      {required this.typeValue,
      required this.name,
      required this.isRequired,
      required this.label,
      this.value});

  @override
  String toString() {
    return 'FormFieldParticipantEntity(typeValue: $typeValue, name: $name, label: $label ,isRequired: $isRequired)';
  }
}
