import 'package:flutter/material.dart';
import 'package:hatsicapp/main.dart';
import 'package:hatsicapp/screens/registro.dart';
import 'package:hatsicapp/services/appstate.dart';
import 'package:hatsicapp/widgets/colors.dart';
import 'package:hatsicapp/widgets/wids.dart';
import 'package:provider/provider.dart';

class SalaEspera extends StatefulWidget {
  @override
  _SalaEsperaState createState() => _SalaEsperaState();
}

class _SalaEsperaState extends State<SalaEspera> {
  TextEditingController _correoController;
  TextEditingController _passController;

  final _formLogin = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _correoController = TextEditingController();
    _passController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final alto = MediaQuery.of(context).size.height;
    final ancho = MediaQuery.of(context).size.width;
    final _state = Provider.of<AppState>(context, listen: true);
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            Colors.grey[100],
            Colors.grey[50],
          ], begin: Alignment.topLeft),
        ),
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text('Hatsi!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 40,
                            fontFamily: 'Chasy')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text('Comida a Domicilio',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontFamily: 'CaviarDreams')),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset('assets/images/al.png'),
                    ),
                  ),
                  Text('Bienvenido',
                      style: TextStyle(color: Colors.grey, fontSize: 20)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('No pases hambre, pasa y toma asiento',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 13)),
                  ),
                  _state.isMsn()
                      ? Expanded(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                  "Enviamos un link de verificación a tu correo, entra en él para activar tu cuenta.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkBackground,
                                  )),
                            ),
                          ),
                        )
                      : Form(
                          key: _formLogin,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      prefixIcon: Icon(Icons.mail),
                                      labelText: 'Correo Electronico',
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _correoController,
                                    validator: (val) {
                                      if (val.isEmpty) {
                                        return "Necesitamos tu correo";
                                      }
                                      RegExp regExp =
                                          new RegExp(r'^[^@]+@[^@]+\.[^@]+');
                                      if (!regExp.hasMatch(val.toString())) {
                                        return "Formato incorrecto";
                                      }
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(Icons.vpn_key),
                                        labelText: 'Contraseña'),
                                    controller: _passController,
                                    obscureText: true,
                                    validator: (val) {
                                      if (val.length < 6) {
                                        return "La contraseña es muy corta.";
                                      }
                                      if (val.isEmpty) {
                                        return "Esto es muy importante";
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, bottom: 5.0, top: 2.0),
                    child: InkWell(
                      onTap: () async {
                        if (_formLogin.currentState.validate()) {
                          try {
                            _state.loginIn(
                              _correoController.text,
                              _passController.text,
                            );
                          } catch (e) {
                            _state.salioError(e);
                          }
                        }
                      },
                      child: Container(
                        width: ancho,
                        height: alto * 0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: _state.isError()
                              ? LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [AppColors.redBackground, Colors.red])
                              : LinearGradient(
                                  colors: [Colors.grey[800], Colors.grey[900]]),
                        ),
                        child: Center(
                          child: _state.isloading()
                              ? CircularProgressIndicator()
                              : Text(
                                  'Ingresar',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                        ),
                      ),
                    ),
                  ),
                  _state.isError()
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 20.0),
                          child: Text(
                            _state.errorM,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red, fontSize: 13),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 20.0),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Registro(),
                                  ),
                                );
                              },
                              child: Text(
                                  '¿Aún no eres parte de nosotros?\n Registrate Aquí',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13))),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
