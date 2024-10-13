import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/domain/domain.dart';

class HomeDataAppBarWidget extends StatelessWidget {
  const HomeDataAppBarWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.data,
      required this.event});

  final double height;
  final double width;
  final HomeAppBarDataEntity data;
  final Function(String?) event;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      height: height,
      width: width,
      color: Colors.yellow.withOpacity(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //! Nombre
          _Name(data: data, height: height),
          //! Codigo Modelo
          _ModelCode(height: height, data: data),
          //! Espacio
          SizedBox(
            height: height * 0.05,
          ),
          //! Rama Modelo List
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            width: width * 0.85,
            height: height * 0.3,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.1, 1.0],
                    colors: [AppColors.first, AppColors.third]),
                borderRadius: BorderRadius.all(Radius.circular(height * 0.2)),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.first.withOpacity(0.2),
                      blurRadius: height * 0.05,
                      spreadRadius: 0.01)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Titulo
                Text(
                  'Modelorama: ',
                  style: TextStyle(
                      color: AppColors.seventh,
                      overflow: TextOverflow.ellipsis,
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w300,
                      fontSize: height * 0.2),
                ),
                // Drodow listado
                _DropDownModelBranchList(
                  data: data.modelsList,
                  height: height,
                  width: width,
                  event: event,
                )
              ],
            ),
          ),
          //! Espacio
          const Expanded(
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}

/// Listado - dropdown - rama de modelo
class _DropDownModelBranchList extends StatefulWidget {
  const _DropDownModelBranchList({
    required this.data,
    required this.height,
    required this.width,
    required this.event,
  });

  final double height;
  final double width;
  final Map<String, String> data;
  final Function(String?) event;

  @override
  State<_DropDownModelBranchList> createState() =>
      _DropDownModelBranchListState();
}

class _DropDownModelBranchListState extends State<_DropDownModelBranchList> {
  // Valor seleccionado
  String? selectedValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        color: Colors.green.withOpacity(0),
        child: Theme(
          data: Theme.of(context).copyWith(
            // Color del fondo de los items
            canvasColor: AppColors.third,
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
                          color: AppColors.seventh,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: 'NotoSans',
                          fontWeight: FontWeight.w700,
                          fontSize: widget.height * 0.2)));
            }).toList(),
            onChanged: (newValue) {
              widget.event(newValue);
              setState(() {
                selectedValue = newValue;
              });
            },
          ),
        ),
      ),
    );
  }

  Container _icon() {
    return Container(
      width: widget.width * 0.08,
      height: widget.height,
      color: Colors.red.withOpacity(0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.scale(
              scale: widget.width * 0.005,
              child: Icon(
                Icons.arrow_drop_down_rounded,
                color: AppColors.seventh,
              ))
        ],
      ),
    );
  }

  Text _hint() {
    return Text(
      '- Selecciona -',
      style: TextStyle(
          color: AppColors.seventh,
          overflow: TextOverflow.ellipsis,
          fontFamily: 'NotoSans',
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w500,
          fontSize: widget.height * 0.2),
    );
  }
}

/// Widget para el código del modelo
class _ModelCode extends StatelessWidget {
  const _ModelCode({
    super.key,
    required this.height,
    required this.data,
  });

  final double height;
  final HomeAppBarDataEntity data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Titulo
        Text(
          'Cod.Modelo: ',
          style: TextStyle(
              color: AppColors.seventh,
              overflow: TextOverflow.ellipsis,
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.w300,
              fontSize: height * 0.2),
        ),
        // Codigo
        Text(
          data.modelCode,
          style: TextStyle(
              color: AppColors.seventh,
              overflow: TextOverflow.ellipsis,
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.w700,
              fontSize: height * 0.2),
        ),
      ],
    );
  }
}

/// Widget para el nombre
class _Name extends StatelessWidget {
  const _Name({
    required this.data,
    required this.height,
  });

  final HomeAppBarDataEntity data;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Text(
      data.name,
      style: TextStyle(
          color: AppColors.seventh,
          overflow: TextOverflow.ellipsis,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w700,
          fontSize: height * 0.2),
    );
  }
}
