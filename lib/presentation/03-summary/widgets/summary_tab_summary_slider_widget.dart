import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';

class SummaryTabSummarySliderWidget extends StatefulWidget {
  const SummaryTabSummarySliderWidget(
      {super.key,
      required this.heightBar,
      required this.width,
      required this.valueSlider});

  final double heightBar; // Ancho eje Y slider
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
        activeTrackColor: Colors.transparent, // color seleccionado
        inactiveTickMarkColor: Colors.transparent, // color no seleccionado
        thumbShape: CustomSliderThumbShape(
            thumbRadius: widget.heightBar * 1.0,
            valueSlider: currentSliderValue
                .toStringAsFixed(0)), // Esfera de seleccion personalizada
        trackShape: CustomTrackShape(),
      ),
      child: SizedBox(
        width: widget.width,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            // Slider zona no seleccionada
            _unselectedZone(),
            // Slider zona seleccionada
            _selectedZone(),
            // Slider con el theme aplicado
            _slider(),
          ],
        ),
      ),
    );
  }

  Slider _slider() {
    return Slider(
      value: currentSliderValue,
      min: 0,
      max: 100,
      divisions: null,
      label: currentSliderValue.round().toString(),
      onChanged: null,
    );
  }

  Container _unselectedZone() {
    return Container(
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
              spreadRadius: widget.heightBar * 0.001,
              blurRadius: widget.heightBar * 0.002),
          // Sombra superior
          BoxShadow(
              color: AppColors.thirteenth.withOpacity(0.8),
              offset: Offset(0, -widget.heightBar * 0.06),
              spreadRadius: widget.heightBar * 0.02,
              blurRadius: widget.heightBar * 0.02),
        ],
        borderRadius: borderRadius,
      ),
    );
  }

  LayoutBuilder _selectedZone() {
    return LayoutBuilder(
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
                  offset: Offset(widget.width * 0, widget.heightBar * 0.3),
                  spreadRadius: widget.heightBar * 0.01,
                  blurRadius: widget.heightBar * 0.2)
            ],
            borderRadius: borderRadius,
          ),
        );
      },
    );
  }
}

/// Personalización del barra del slider
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
  }) {}
}

/// Personalización de la esfera del slider
class CustomSliderThumbShape extends SliderComponentShape {
  CustomSliderThumbShape({
    required this.thumbRadius,
    required this.valueSlider,
  });

  // Tamaño del thumb
  final double thumbRadius;
  // Valor
  final String valueSlider;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(thumbRadius * 2, thumbRadius * 2);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    // Dibujar la sombra del thumb
    final Paint shadowPaint = Paint()
      ..color = AppColors.first.withOpacity(0.6)
      ..maskFilter = const MaskFilter.blur(
          BlurStyle.normal, 4); // Desenfoque para la sombra
    canvas.drawCircle(
        center, thumbRadius + 4, shadowPaint); // Sombra más grande que el thumb

    // Gradiente
    final Paint paint = Paint()
      ..shader = LinearGradient(
        colors: [
          AppColors.sixteenth,
          AppColors.sixteenth,
        ],
      ).createShader(Rect.fromCircle(center: center, radius: thumbRadius));

    // Dibujar el thumb
    canvas.drawCircle(center, thumbRadius, paint);

    // Texto
    final textSpan = TextSpan(
      text: '$valueSlider%',
      style: TextStyle(
        fontFamily: 'NotoSans',
        fontSize: thumbRadius * 0.9,
        color: AppColors.seventh,
        fontWeight: FontWeight.w700,
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: textDirection,
    );
    textPainter.layout();

    // Texto centrado
    final Offset textOffset = Offset(
      center.dx - (textPainter.width / 2),
      center.dy - (textPainter.height / 2),
    );

    // Dibujar
    textPainter.paint(canvas, textOffset);
  }
}
