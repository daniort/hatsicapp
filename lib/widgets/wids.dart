import 'package:flutter/material.dart';
import 'package:hatsicapp/widgets/colors.dart';

Widget snacks(String label, GlobalKey<ScaffoldState> scaffoldKey) {
  scaffoldKey.currentState.showSnackBar(SnackBar(
    content: Text(label),
    backgroundColor: AppColors.redBackground,
    duration: Duration(milliseconds: 3000),
  ));
}

String tipeerror(String code) {
  switch (code) {
    case "ERROR_OPERATION_NOT_ALLOWED":
      return ("Anonymous accounts are not enabled");
      break;
    case "ERROR_WEAK_PASSWORD":
      return ("Tu contraseña es muy corta,\nRevísalo nuevamente");
      break;
    case "ERROR_WRONG_PASSWORD":
      return ("La Contraseña es incorrecta\n nRevísalo nuevamente");
      break;
    case "ERROR_USER_DISABLED":
      return ("Este usuario esta desabilitado\n Vuelve en unos días");
      break;
    case "ERROR_OPERATION_NOT_ALLOWED":
      return ("Este usuario esta desabilitado\n Vuelve en unos días");
      break;
    case "ERROR_INVALID_EMAIL":
      return ("Tu email parece ser incorrecto\nRevísalo nuevamente");
      break;
    case "ERROR_USER_NOT_FOUND":
      return ("Este email no esta registrado\nRevísalo nuevamente");
      break;
    case "ERROR_EMAIL_ALREADY_IN_USE":
      return ("Este email ya está en uso,\nRevísalo nuevamente");
      break;
    case "ERROR_INVALID_CREDENTIAL":
      return ("Tu email es incorrecto,\nRevísalo nuevamente");
      break;
    case "ERROR_TOO_MANY_REQUESTS":
      return ("Esos fueron muchos intentos,\n Inténtalo mas tarde");
      break;
    default:
      return ("Algo salió mal,\Inténtalo nuevamente");
  }
}
