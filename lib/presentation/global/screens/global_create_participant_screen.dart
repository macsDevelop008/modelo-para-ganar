import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/infrastructure/infrastructure.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

class GlobalCReateParticipantScreen extends StatelessWidget {
  const GlobalCReateParticipantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final heightRoundedSquare = ResponsiveDimentions.height(context, 0.6);
    final widthRoundedSquare = ResponsiveDimentions.width(context, 0.7);

    final inputsHeight = heightRoundedSquare * 0.15;
    final inputsWidth = widthRoundedSquare * 0.8;

    // Inputs controller
    final nameController = TextEditingController();
    final identificationController = TextEditingController();
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final confirmPassController = TextEditingController();

    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(heightRoundedSquare * 0.03),
      width: widthRoundedSquare,
      height: heightRoundedSquare,
      decoration: BoxDecoration(
          // Color
          color: AppColors.sixth,
          // Bordes redondeados
          borderRadius:
              BorderRadius.all(Radius.circular(widthRoundedSquare * 0.07)),
          border: Border.all(color: AppColors.tenth.withOpacity(0.6))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //! Titulo
          Text(
            'Crear Participante',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: 'NotoSans',
                fontSize: heightRoundedSquare * 0.05,
                fontWeight: FontWeight.w700,
                color: AppColors.seventh),
          ),
          //! Espacio
          SizedBox(
            height: heightRoundedSquare * 0.02,
          ),
          //! Inputs datos ingresar
          Container(
            width: double.infinity,
            height: heightRoundedSquare * 0.7,
            color: Colors.red.withOpacity(0),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //! Input nombre
                    LogInTitleInputTextWidget(
                      width: inputsWidth,
                      height: inputsHeight,
                      hintText: 'Nombre*',
                      controller: nameController,
                      title: 'Ingresa el nombre',
                      obscureText: false,
                    ),
                    //! Input Identificación
                    LogInTitleInputTextWidget(
                      width: inputsWidth,
                      height: inputsHeight,
                      hintText: 'Identificación*',
                      controller: identificationController,
                      title: 'Ingresa la identificación',
                      obscureText: false,
                    ),
                    //! Input email
                    LogInTitleInputTextWidget(
                      width: inputsWidth,
                      height: inputsHeight,
                      hintText: 'Email*',
                      controller: emailController,
                      title: 'Ingresa el email',
                      obscureText: false,
                    ),
                    //! Input Contraseña
                    LogInTitleInputTextWidget(
                      width: inputsWidth,
                      height: inputsHeight,
                      hintText: 'Contraseña*',
                      controller: passController,
                      title: 'Ingresa la contraseña',
                      obscureText: false,
                    ),
                    //! Input confirm contraseña
                    LogInTitleInputTextWidget(
                      width: inputsWidth,
                      height: inputsHeight,
                      hintText: 'Confirm. Contraseña*',
                      controller: confirmPassController,
                      title: 'Ingresa la contraseña de nuevo',
                      obscureText: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
          //! Linea divisora
          const Divider(),
          //! Botones
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //! Boton cancelar
              ElevatedButton(
                  onPressed: () {
                    _cancel(
                        context,
                        nameController.text,
                        identificationController.text,
                        emailController.text,
                        passController.text,
                        confirmPassController.text);
                  },
                  child: Text(
                    'Cancelar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w700,
                        color: AppColors.third,
                        fontSize: widthRoundedSquare * 0.07),
                  )),
              //! Boton crear
              ElevatedButton(
                  onPressed: () async {
                    //TODO: test
                    final d = HttpServiceDioDatasourceImpl();
                    final r = HttpServiceRepositoryImpl(datasource: d);
                    final res = await r.singupFormFields(
                        'c6945a6163b696e643f166c53ead573a', '4u');
                    if (res.$1 && res.$2 != null) {
                      for (var element in res.$2!) {
                        print(element.toString());
                      }
                    } else {
                      print('mallll');
                    }
                  },
                  child: Text(
                    'Crear',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w700,
                        color: AppColors.third,
                        fontSize: widthRoundedSquare * 0.07),
                  )),
            ],
          )
        ],
      ),
    );
  }

  //! Evento para crear participante
  Future<void> _createParticipant() async {}

  Future<void> _confirmCreateParticipant() async {}

  //! Evento para cancelar la creación del participante
  void _cancel(BuildContext context, String name, String identification,
      String email, String pass, String confirmPass) {
    // Si no tiene informarción
    if (name == '' &&
        identification == '' &&
        email == '' &&
        pass == '' &&
        confirmPass == '') {
      // Cerrar modal
      closeModal(context);
    } else {
      _confirmCancel(context, name, identification, email, pass, confirmPass);
    }
  }

  void _confirmCancel(BuildContext context, String name, String identification,
      String email, String pass, String confirmPass) {
    showWarningModal(context, '¿Deseas cancelar la creación?', () {
      // Cerrar modal
      closeModal(context);
    }, () {});
  }
}
