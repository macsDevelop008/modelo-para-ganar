import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

class SummaryTabSummayScreen extends StatelessWidget {
  const SummaryTabSummayScreen({super.key});

  static const String name = 'summary-tab-summary-screen';

  Column _allData(double heightRoundedSquare, double widthRoundedSquare,
      String currentFilter, WidgetRef ref, AsyncSnapshot<dynamic> snapshot) {
    return Column(
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
            percentageValue: getTotalSliderValue(snapshot.data, currentFilter)),
        //! Filtro - dropDownList
        SummaryTabSummaryDropwdownListView(
          height: heightRoundedSquare * 0.08,
          width: widthRoundedSquare,
          initialValue: currentFilter,
          data: const {
            '1': 'Cartones',
            '2': 'Hectolitros',
          },
          event: (String? value) {
            if (value != null) {
              // Si el valor del filtro es diferente al actual
              if (value != currentFilter) {
                // Cambiar  filtro al nuevo
                ref
                    .read(reverpodFilterSummayTabSummaryProvider.notifier)
                    .update((state) => value);
              }
            }
          },
        ),
        //! Estadisticas - sliders circulares y %
        SummaryTabSummaryCirclesSliderDataView(
          listKIPs: snapshot.data,
          filterValue: currentFilter,
        ),
      ],
    );
  }

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
          final heightRoundedSquare = height * 0.9;
          final widthRoundedSquare = width * 0.95;

          return
              // Espacio base
              Container(
                  margin: EdgeInsets.only(top: height * 0.04),
                  alignment: Alignment.topCenter,
                  color: Colors.pink.withOpacity(0.0),
                  child:
                      // Base cuadrado redondeado
                      _squareRounded(
                    height, widthRoundedSquare,
                    heightRoundedSquare, width, // Datos del tab
                    Consumer(
                      builder:
                          (BuildContext context, WidgetRef ref, Widget? child) {
                        // Obtener el valor del filtro seleccionado
                        final currentFilter =
                            ref.watch(reverpodFilterSummayTabSummaryProvider);

                        // Calculo a mostrar os datos del tab
                        return FutureBuilder(
                          future: listKips(currentFilter),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            // Si está cargando la información
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: Platform.isIOS
                                    ? CupertinoActivityIndicator(
                                        color: AppColors.seventh,
                                      )
                                    : CircularProgressIndicator(
                                        color: AppColors.seventh,
                                      ),
                              );
                            }
                            // Si se generó un error en la carga
                            else if (snapshot.hasError) {
                              return Text(snapshot.error!.toString());
                            }
                            // Si no, carga satisfactoria
                            else {
                              // Data despues de cargar los datos necesarios
                              return _allData(
                                  heightRoundedSquare,
                                  widthRoundedSquare,
                                  currentFilter,
                                  ref,
                                  snapshot);
                            }
                          },
                        );
                      },
                    ),
                  ));
        },
      ),
    );
  }

  Container _squareRounded(double height, double widthRoundedSquare,
      double heightRoundedSquare, double width, Widget child) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(height * 0.03),
      width: widthRoundedSquare,
      height: heightRoundedSquare,
      decoration: BoxDecoration(
          // Color
          color: AppColors.sixth,
          // Bordes redondeados
          borderRadius: BorderRadius.all(Radius.circular(width * 0.07)),
          border: Border.all(color: AppColors.tenth.withOpacity(0.6))),
      child: child,
    );
  }
}
