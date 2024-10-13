import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';

class SummaryTabNavigationButtonWidget extends StatelessWidget {
  const SummaryTabNavigationButtonWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.isSelected,
      required this.text,
      required this.event});

  final double height;
  final double width;
  final bool isSelected;
  final String text;
  final VoidCallback event;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: isSelected ? _decoration() : null,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(width * 0.2)),
        child: RawMaterialButton(
          onPressed: () {
            event();
          },
          child: Container(
            alignment: Alignment.center,
            height: height,
            width: width,
            child:
                //! Texto
                Text(text,
                    style: TextStyle(
                        color: isSelected
                            ? AppColors.first
                            : AppColors.seventh.withOpacity(0.4),
                        overflow: TextOverflow.ellipsis,
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w700,
                        fontSize: height * 0.45)),
          ),
        ),
      ),
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
        // Gradiente
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.twelfth,
              AppColors.fourteenth,
            ]),
        // Redondeado
        borderRadius: BorderRadius.all(Radius.circular(width * 0.2)),
        // Sombra
        boxShadow: [
          BoxShadow(
            color: AppColors.first.withOpacity(0.2),
            blurRadius: width * 0.02,
            spreadRadius: width * 0.01,
          ),
        ]);
  }
}
