import 'package:flutter/material.dart';
import 'package:hatsicapp/main.dart';
import 'package:hatsicapp/services/appstate.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final _state = Provider.of<AppState>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        iconTheme: IconThemeData(
          color: Colors.grey[600]
        ),
        elevation: 2.0,
        title: Text(
          "Mis Datos",
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.grey[600]),
        ),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.verified_user,
                  color: Colors.grey[600],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _state.dataUser['nombre'],
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.grey[600]),
                  )),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.phone,
                  color: Colors.grey[600],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _state.dataUser['numero'].toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.grey[600]),
                  )),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.email,
                  color: Colors.grey[600],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _state.dataUser['correo'].toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.grey[600]),
                  )),
            ],
          ),
          GestureDetector(
            onTap: () {
              _state.logout();
              Navigator.of(context).pop();
            },
            child: Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.exit_to_app,
                      color: Colors.grey[600],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Cerrar Sesión",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
