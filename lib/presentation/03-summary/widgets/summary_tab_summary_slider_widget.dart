import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';

class SummaryTabSummarySliderWidget extends StatefulWidget {
  const SummaryTabSummarySliderWidget(
      {super.key,
      required this.heightBar,
      required this.width,
      required this.valueSlider});

  final double heightBar; // Grosor eje Y slider
  final double width;
  final double valueSlider;

  @override
  State<SummaryTabSummarySliderWidget> createState() =>
      _SummaryTabSummarySliderWidgetState();
}

class _SummaryTabSummarySliderWidgetState
    extends State<SummaryTabSummarySliderWidget> {
  // Valor del slider
  late double currentSliderValue;

  // Propiedades generales del slider
  late BorderRadiusGeometry? borderRadius;

  @override
  void initState() {
    super.initState();

    // Inicializar el valor del slider
    currentSliderValue = widget.valueSlider;

    borderRadius = BorderRadius.circular(widget.width * 0.3);
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        //trackHeight: widget.height * 0.3, // alto
        activeTrackColor: Colors.transparent, // color seleccionado
        inactiveTickMarkColor: Colors.transparent, // color no seleccionado
        thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 12.0), // Esfera de seleccion
        thumbColor: Colors.white, // Color esfera seleccion
        overlayColor:
            Colors.black.withOpacity(0.1), // sombra de la esfera de seleccion
        overlayShape: RoundSliderOverlayShape(
            overlayRadius: 24.0), // tamaño sobra de la esfera de seleccion
        trackShape: CustomTrackShape(),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          // Slider zona no seleccionada
          Container(
            height: widget.heightBar,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.first, AppColors.second]),
              boxShadow: [
                // Sombra inferior
                BoxShadow(
                    color: AppColors.seventh.withOpacity(0.3),
                    offset: Offset(0, widget.heightBar * 0.02),
                    spreadRadius: widget.width * 0.001,
                    blurRadius: widget.width * 0.002),
                // Sombra superior
                BoxShadow(
                    color: AppColors.thirteenth.withOpacity(0.8),
                    offset: Offset(0, -widget.heightBar * 0.06),
                    spreadRadius: widget.width * 0.02,
                    blurRadius: widget.width * 0.02),
              ],
              borderRadius: borderRadius,
            ),
          ),
          // Slider zona seleccionada
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                height: widget.heightBar + widget.heightBar * 0.1,
                width: constraints.maxWidth * (currentSliderValue / 100),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.fifteenth,
                      AppColors.sixteenth,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.first.withOpacity(0.5),
                        offset:
                            Offset(widget.width * 0, widget.heightBar * 0.3),
                        spreadRadius: widget.heightBar * 0.01,
                        blurRadius: widget.heightBar * 0.2)
                  ],
                  borderRadius: borderRadius,
                ),
              );
            },
          ),
          Slider(
            value: currentSliderValue,
            min: 0,
            max: 100,
            divisions: null,
            label: currentSliderValue.round().toString(),
            onChanged: null,
          ),
        ],
      ),
    );
  }
}

class CustomTrackShape extends SliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 2.0;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isEnabled = false,
    bool isDiscrete = false,
    required TextDirection textDirection,
  }) {
    // Deja vacía la pintura ya que usamos el Stack para manejar el diseño de la barra.
  }
}
