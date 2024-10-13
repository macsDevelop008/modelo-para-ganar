import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';

class BaseInternalOptionsButtonAppBarWidget extends StatelessWidget {
  const BaseInternalOptionsButtonAppBarWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.event});

  final double width;
  final double height;
  final VoidCallback event;

  @override
  Widget build(BuildContext context) {
    final decorationHeight = height * 0.08;
    return GestureDetector(
      // Evento
      onTap: () {
        event();
      },
      child: Container(
        alignment: Alignment.centerRight,
        color: Colors.red.withOpacity(0),
        width: width,
        height: height,
        child:
            // Items decoración
            Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Decoración 1
            _Decoration(
              width: width * 1,
              height: decorationHeight,
              color: AppColors.twelfth,
            ),
            // Decoración 2
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _Decoration(
                  width: width * 0.55,
                  height: decorationHeight,
                  color: AppColors.twelfth,
                ),
                // Espacio
                SizedBox(
                  width: width * 0.03,
                ),
                _Decoration(
                  width: width * 0.25,
                  height: decorationHeight,
                  color: AppColors.twelfth,
                ),
              ],
            ),
            // Decoración 3
            _Decoration(
              width: width * 0.45,
              height: decorationHeight,
              color: AppColors.twelfth,
            ),
          ],
        ),
      ),
    );
  }
}

class _Decoration extends StatelessWidget {
  const _Decoration(
      {required this.width, required this.height, required this.color});

  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: height * 1),
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(height * 0.6)),
    );
  }
}
