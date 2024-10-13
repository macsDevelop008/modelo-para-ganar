import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

class SummaryTabSummaryTitleSubTitleView extends StatelessWidget {
  const SummaryTabSummaryTitleSubTitleView(
      {super.key,
      required this.height,
      required this.width,
      required this.title,
      required this.subTitle,
      required this.instructions});

  final double height;
  final double width;
  final String title;
  final String subTitle;
  final String instructions;

  @override
  Widget build(BuildContext context) {
    // Tamaños base
    final widthBase = width;
    final heightBase = height * 0.38;

    return Container(
      alignment: Alignment.topLeft,
      color: Colors.red.withOpacity(0.0),
      width: widthBase,
      height: heightBase,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //! Titulo
          SummaryTabSummaryTextWidget(
            text: title,
            color: AppColors.twelfth,
            size: heightBase * 0.12,
            fontWeight: FontWeight.w700,
            maxLines: 1,
          ),
          //! Subtitulo
          SummaryTabSummaryTextWidget(
            text: subTitle,
            color: AppColors.seventh,
            size: heightBase * 0.12,
            fontWeight: FontWeight.w700,
            maxLines: 2,
          ),
          //! Instruccion
          SummaryTabSummaryTextWidget(
            text: instructions,
            color: AppColors.seventh,
            size: heightBase * 0.093,
            fontWeight: FontWeight.w300,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
