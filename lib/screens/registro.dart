import 'package:flutter/material.dart';
import 'package:hatsicapp/main.dart';
import 'package:hatsicapp/services/appstate.dart';
import 'package:hatsicapp/widgets/colors.dart';
import 'package:hatsicapp/widgets/wids.dart';
import 'package:provider/provider.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  TextEditingController _nombreController;
  TextEditingController _correoController;
  TextEditingController _numeroController;
  TextEditingController _passController;

  final _formRegistro = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController();
    _correoController = TextEditingController();
    _numeroController = TextEditingController();
    _passController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final alto = MediaQuery.of(context).size.height;
    final ancho = MediaQuery.of(context).size.width;
    final _state = Provider.of<AppState>(context, listen: true);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Registro',
          style: TextStyle(
            color: Colors.grey[500],
          ),
        ),
        backgroundColor: Colors.grey[100],
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.grey[400],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Icon(
                Icons.supervised_user_circle,
                color: Colors.grey[300],
                size: alto * 0.15,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Form(
              key: _formRegistro,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nombre Completo',
                          prefixIcon: Icon(Icons.person_pin),
                        ),
                        keyboardType: TextInputType.text,
                        controller: _nombreController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return "Hey, ¿Cuál es tu nombre?";
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.mail),
                          labelText: 'Correo Electronico',
                        ),
                        controller: _correoController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          if (val.isEmpty) {
                            return "Necesitamos tu correo";
                          }
                          RegExp regExp = new RegExp(r'^[^@]+@[^@]+\.[^@]+');
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
                            prefixIcon: Icon(Icons.phone_android),
                            labelText: 'Número de Telefono'),
                        controller: _numeroController,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        validator: (val) {
                          if (val.isEmpty) {
                            return "Esto esta vacío, llénalo";
                          }
                          if (val.length < 10) {
                            return "Esperamos 10 números, creo que te comiste alguno.";
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
              : SizedBox(),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () async {
                if (_formRegistro.currentState.validate()) {
                  try {
                    bool _registrado = await _state.signUp(
                      _nombreController.text,
                      _correoController.text,
                      _numeroController.text,
                      _passController.text,
                    );
                    if (_registrado == true) {
                      Navigator.of(context).pop();
                    }
                  } catch (e) {
                    print(">>>>>>>>haha>>>>><<");
                    _state.salioError(tipeerror(e.code));
                  }
                }
              },
              child: Container(
                width: ancho,
                height: alto * 0.06,
                decoration: BoxDecoration(
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
                          'Enviar',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
