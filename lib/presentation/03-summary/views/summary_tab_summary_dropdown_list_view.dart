import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

class SummaryTabSummaryDropwdownListView extends StatelessWidget {
  const SummaryTabSummaryDropwdownListView(
      {super.key,
      required this.height,
      required this.width,
      required this.data,
      required this.event,
      required this.initialValue});

  final double height;
  final double width;
  final String initialValue;
  final Map<String, String> data;
  final Function(String?) event;

  @override
  Widget build(BuildContext context) {
    // Tamaños del slider
    final widthSliderBase = width * 0.3;
    final heightSliderBase = height * 0.8;

    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: height * 0.2),
      width: width,
      height: height,
      color: Colors.red.withOpacity(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //! Titulo
          Text(
            'Filtrar por:',
            style: TextStyle(
                fontFamily: 'NotoSans',
                fontWeight: FontWeight.w300,
                color: AppColors.seventh,
                fontSize: height * 0.52),
          ),
          //! DropDownList
          SummaryTabSummaryDropDownWidget(
            height: heightSliderBase,
            width: widthSliderBase,
            data: data,
            event: event,
            initialValue: initialValue,
          ),
        ],
      ),
    );
  }
}
