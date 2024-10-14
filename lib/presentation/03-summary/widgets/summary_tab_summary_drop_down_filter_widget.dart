import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';

class SummaryTabSummaryDropDownWidget extends StatelessWidget {
  const SummaryTabSummaryDropDownWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.data,
      required this.event});

  final double height;
  final double width;
  final Map<String, String> data;
  final Function(String?) event;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      width: width,
      height: height,
      color: Colors.green.withOpacity(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //! Base - DropDownList
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
            width: width * 0.9,
            height: height,
            decoration: BoxDecoration(
                color: AppColors.seventh,
                borderRadius: BorderRadius.all(Radius.circular(width * 0.07)),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.first.withOpacity(0.3),
                      blurRadius: width * 0.02,
                      spreadRadius: width * 0.001)
                ]),
            //! Slider
            child: _DropDownButtonFilter(
              height: height,
              width: width * 0.28,
              data: data,
              event: event,
            ),
          )
        ],
      ),
    );
  }
}

class _DropDownButtonFilter extends StatefulWidget {
  const _DropDownButtonFilter(
      {required this.height,
      required this.width,
      required this.data,
      required this.event});

  final double height;
  final double width;
  final Map<String, String> data;
  final Function(String?) event;

  @override
  State<_DropDownButtonFilter> createState() => __DropDownButtonFilterState();
}

class __DropDownButtonFilterState extends State<_DropDownButtonFilter> {
  // Valor seleccionado
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: widget.width * 0.2),
      color: Colors.green.withOpacity(0),
      child: Theme(
        data: Theme.of(context).copyWith(
          // Color del fondo de los items
          canvasColor: AppColors.seventh,
        ),
        child: DropdownButton<String>(
          isExpanded: true, // Ocupar espacio disponible
          value: selectedValue,
          underline: const SizedBox(),
          hint: _hint(), // Texto sin seleccion
          icon: _icon(), // Icono
          items: widget.data.entries.map((entry) {
            return DropdownMenuItem<String>(
                value: entry.key,
                child: Text(entry.value,
                    style: TextStyle(
                        color: AppColors.eighth,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w400,
                        fontSize: widget.height * 0.5)));
          }).toList(),
          onChanged: (newValue) {
            widget.event(newValue);
            setState(() {
              selectedValue = newValue;
            });
          },
        ),
      ),
    );
  }

  Container _icon() {
    return Container(
      width: widget.width * 0.8,
      height: widget.height,
      color: Colors.red.withOpacity(0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.scale(
              scale: widget.width * 0.05,
              child: Icon(
                Icons.arrow_drop_down_rounded,
                color: AppColors.sixth,
              ))
        ],
      ),
    );
  }

  Text _hint() {
    return Text(
      '- Selecciona -',
      style: TextStyle(
          color: AppColors.eighth,
          overflow: TextOverflow.ellipsis,
          fontFamily: 'NotoSans',
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w400,
          fontSize: widget.height * 0.5),
    );
  }
}
