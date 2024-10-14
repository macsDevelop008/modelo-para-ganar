import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';

class LogInTitleInputTextWidget extends StatelessWidget {
  const LogInTitleInputTextWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.hintText,
      required this.controller,
      required this.title,
      required this.obscureText});

  final String title;
  final double width;
  final double height;
  final String hintText; // Texto inicial del input
  final bool obscureText; // Es contraseña?
  final TextEditingController controller; // Controlador del input

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue.withOpacity(0),
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //! Titulo
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                  color: AppColors.seventh,
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w700,
                  fontSize: height * 0.17),
            ),
          ),
          //! Base input text
          _InputTextFieldBase(
            height: height,
            width: width,
            hintText: hintText,
            controller: controller,
            obscureText: obscureText,
          )
        ],
      ),
    );
  }
}

/// Clase que contiene la base del input de texto
/// Controla su tamaño y decoración (background no del texto)
class _InputTextFieldBase extends StatelessWidget {
  const _InputTextFieldBase({
    required this.height,
    required this.width,
    required this.hintText,
    required this.controller,
    required this.obscureText,
  });

  final double height;
  final double width;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: height * 0.1),
      width: width,
      height: height * 0.6,
      decoration: BoxDecoration(
          // Color
          color: AppColors.fifth,
          // Bordes redondeados
          borderRadius: BorderRadius.circular(height * 0.1),
          // Borde
          border: Border.all(
            // Color
            color: AppColors.sixth,
            // Ancho
            width: height * 0.03,
          )),
      child:
          //! Input Text
          _InputTextField(
        width: width,
        height: height,
        hintText: hintText,
        controller: controller,
        obscureText: obscureText,
      ),
    );
  }
}

/// Clase que contiene el input de texto
class _InputTextField extends StatefulWidget {
  const _InputTextField(
      {required this.width,
      required this.height,
      required this.hintText,
      required this.controller,
      required this.obscureText});

  final double width;
  final double height;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  @override
  State<_InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<_InputTextField> {
  late bool stateIsObscureText;
  @override
  void initState() {
    super.initState();

    stateIsObscureText = widget.obscureText;
  }

  // Texto inicial del input
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.width * 0.05),
      child: TextField(
        controller: widget.controller,
        textAlign: TextAlign.left, // Eje x
        obscureText: stateIsObscureText, // Ocultar texto
        textAlignVertical: TextAlignVertical.center, // Alineamiento vertical
        onChanged: (value) =>
            widget.obscureText ? onChanged(value) : null, // Evento al escribir
        // Texto ingresado
        style: TextStyle(
            color: AppColors.seventh,
            fontFamily: 'NotoSans',
            fontWeight: FontWeight.w700),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 0), // Eje Y
          isDense: true, // Reduce el padding interno

          // Icono para revelar la contraseña
          suffixIcon: widget.obscureText ? _iconObscureText() : null,
          // Texto indicación
          hintText: widget.hintText,
          hintStyle: TextStyle(
              color: AppColors.sixth,
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  /// Metodo de control para el iconButton revelar contraseña
  IconButton _iconObscureText() {
    return IconButton(
        onPressed: () {
          stateIsObscureText = !stateIsObscureText;
          setState(() {});
        },
        icon: Icon(
          stateIsObscureText
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: AppColors.sixth,
        ));
  }

  /// Evento al cambiar texto
  onChanged(String value) {
    // Si ya no hay texto y permite ver la contraseña
    if (value.isNotEmpty && !stateIsObscureText) return;
    stateIsObscureText = true;
    setState(() {});
  }
}
