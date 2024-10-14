import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

class SummaryTabSummayScreen extends StatelessWidget {
  const SummaryTabSummayScreen({super.key});

  static const String name = 'summary-tab-summary-screen';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (didPop) {
        if (didPop) {
          debugPrint('PopScope: Se intentó hacer pop');
        }
        debugPrint('PopScope: No se puede hacer pop');
      },
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Tamaños base
          final height = constraints.maxHeight;
          final width = constraints.maxWidth;

          // Tamaños cuadrado redondeado
          final heightRoundedSquare = height * 0.85;
          final widthRoundedSquare = width * 0.95;

          return
              // Espacio
              Container(
                  margin: EdgeInsets.only(top: height * 0.04),
                  alignment: Alignment.topCenter,
                  color: Colors.pink.withOpacity(0.0),
                  child:
                      // Base cuadrado redondeado
                      Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.all(height * 0.03),
                    width: widthRoundedSquare,
                    height: heightRoundedSquare,
                    decoration: BoxDecoration(
                        // Color
                        color: AppColors.sixth,
                        // Bordes redondeados
                        borderRadius:
                            BorderRadius.all(Radius.circular(width * 0.07)),
                        border: Border.all(
                            color: AppColors.tenth.withOpacity(0.6))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //! Titulo, Subtitulo e instrucciones
                        SummaryTabSummaryTitleSubTitleView(
                          height: heightRoundedSquare,
                          width: widthRoundedSquare,
                          title: 'Metas por volumen',
                          subTitle:
                              'Estas son las principales metas por volumen que debes cumplir al mes.',
                          instructions:
                              'A medida que avanzas en cada uno, vas sumando el porcentaje de cumplimiento total para obtener tu bonificación.',
                        ),
                        //! Slider progreso
                        SummaryTabSummarySliderView(
                            height: heightRoundedSquare,
                            width: widthRoundedSquare,
                            percentageValue: 30),
                        //! Filtro - dropDownList
                        SummaryTabSummaryDropwdownListView(
                          height: heightRoundedSquare * 0.08,
                          width: widthRoundedSquare,
                          data: {
                            '1': 'Cartones 1',
                            '2': 'Cartones 2',
                            '3': 'Cartones 3'
                          },
                          event: (String? value) {},
                        ),
                        //! Estadisticas - arcos y %
                        SummaryTabSummaryCirclesSliderDataView(),
                      ],
                    ),
                  ));
        },
      ),
    );
  }
}
