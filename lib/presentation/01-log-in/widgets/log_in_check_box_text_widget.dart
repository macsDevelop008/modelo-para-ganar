import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';

class LogInCheckBoxTextWidget extends StatelessWidget {
  const LogInCheckBoxTextWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.text,
      required this.textEvent,
      required this.eventText,
      required this.eventCheckBox});

  final double width;
  final double height;
  final String text;
  final String textEvent;
  final VoidCallback eventText;
  final Function(bool?) eventCheckBox;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //! Checkbox
        _CheckBox(
          height: height * 0.30,
          eventCheckBox: eventCheckBox,
        ),
        //! Espacio
        SizedBox(
          width: width * 0.02,
        ),
        //! Titulo
        _TextEvent(
            text: text,
            height: height,
            eventText: eventText,
            textEvent: textEvent)
      ],
    );
  }
}

/// Widget del texto con evento
class _TextEvent extends StatelessWidget {
  const _TextEvent({
    required this.text,
    required this.height,
    required this.eventText,
    required this.textEvent,
  });

  final String text;
  final double height;
  final VoidCallback eventText;
  final String textEvent;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Texto sin evento
        Text(
          text,
          style: TextStyle(
              fontFamily: 'NotoSans',
              fontSize: height * 0.25,
              color: AppColors.seventh,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic),
        ),
        // Texto con evento
        GestureDetector(
          onTap: () {
            eventText();
          },
          child: Text(
            textEvent,
            style: TextStyle(
              fontFamily: 'NotoSans',
              fontSize: height * 0.25,
              color: AppColors.seventh,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.seventh,
              decorationThickness: height * 0.013,
            ),
          ),
        ),
      ],
    );
  }
}

/// Widget checkbox
class _CheckBox extends StatefulWidget {
  const _CheckBox({
    required this.height,
    required this.eventCheckBox,
  });

  final double height;
  final Function(bool?) eventCheckBox;

  @override
  State<_CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<_CheckBox> {
  late bool isCheck;

  @override
  void initState() {
    super.initState();

    isCheck = false;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(widget.height * 0.2)),
      child: Container(
        color: AppColors.tenth,
        height: widget.height,
        width: widget.height,
        child: // Checkbox
            Transform.scale(
          scale: widget.height * 0.05,
          child: Checkbox(
              value: isCheck,
              activeColor: AppColors.tenth,
              checkColor: AppColors.fifth,
              side: BorderSide(color: AppColors.tenth),
              onChanged: (value) {
                setState(() {
                  isCheck = !isCheck;
                });
                widget.eventCheckBox(value);
              }),
        ),
      ),
    );
  }
}
