import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String name = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: ResponsiveDimentions.height(context, 1),
        width: ResponsiveDimentions.width(context, 1),
        child: Stack(
          alignment: Alignment.center,
          children: const [
            //! Fondo
            GlobalBackgrpundColorView(),
            //! App Bar Personalizado
            Positioned(top: 0, child: HomeAppBarView()),
          ],
        ),
      ),
    );
  }
}
