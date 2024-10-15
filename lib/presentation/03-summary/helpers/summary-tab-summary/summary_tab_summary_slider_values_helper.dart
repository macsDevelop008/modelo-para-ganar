import 'package:modelo_para_ganar/domain/domain.dart';

double getTotalSliderValue(List<KipDataEntity> listKIPs, String currentFilter) {
  double result = 0;

  double totalSumGoals = 0;
  double totalSumCurrent = 0;

  for (var element in listKIPs) {
    // Si el filtro es 1 = Cartones
    if (currentFilter == '1') {
      totalSumGoals += element.goalCartones!;
      totalSumCurrent += element.currentCartones ?? 0;
    }

    // Si el filtro es 2 = Hectolitros
    if (currentFilter == '2') {
      totalSumGoals += element.goalHectolitros!;
      totalSumCurrent += element.currentHectolitros ?? 0;
    }
  }

  result = (totalSumCurrent / totalSumGoals) * 100;

  return result;
}
