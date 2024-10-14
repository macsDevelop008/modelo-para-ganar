import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

void showDialogCreateParticipant(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: AppColors.first.withOpacity(0.4),
        child: Container(
          color: AppColors.first.withOpacity(0.4),
          child: const GlobalCReateParticipantScreen(),
        ),
      );
    },
  );
}
