/// Representa un KIP con su nombre y valores para sacar %
class KipDataEntity {
  String name;
  int? goalHectolitros;
  int? goalCartones;
  int? currentHectolitros;
  int? currentCartones;

  KipDataEntity({
    required this.name,
    this.goalHectolitros,
    this.goalCartones,
    this.currentHectolitros,
    this.currentCartones,
  });

  @override
  String toString() {
    return 'KipDataEntity{name: $name, goalHectolitros: $goalHectolitros, goalCartones: $goalCartones, currentHectolitros: $currentHectolitros, currentCartones: $currentCartones}';
  }

  /// Obtener porcentaje cartones meta vs valor actual
  double getPercentageCartones() {
    // Si no tiene meta
    if (goalCartones == null) return -1;

    // Si no tiene valor actual
    if (currentCartones == null) return 0;

    // Calcula porcentaje y retorna valor con 1 sola decimal
    var percentage = (currentCartones! / goalCartones!) * 100;

    return double.parse(percentage.toStringAsFixed(1));
  }

  /// Obtener porcentaje cartones meta vs valor actual
  double getPercentageHectolitros() {
    // Si no tiene meta
    if (goalHectolitros == null) return -1;

    // Si no tiene valor actual
    if (currentHectolitros == null) return 0;

    // Calcula porcentaje y retorna valor con 1 sola decimal
    var percentage = (currentHectolitros! / goalHectolitros!) * 100;

    return double.parse(percentage.toStringAsFixed(1));
  }
}
