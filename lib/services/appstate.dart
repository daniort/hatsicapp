import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hatsicapp/models/userModel.dart';
import 'package:hatsicapp/widgets/wids.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  SharedPreferences _prefs;
  DocumentSnapshot dataUser;
   Firestore _db = Firestore.instance;

  String idUser = "";
  String errorM = "";
  String infoM = "";
  bool _login = false;
  bool _loading = false;
  bool _error = false;
  bool _mensaje = false;
  AppState() {
    loginState();
  }
  void loginState() async {
    _prefs = await SharedPreferences.getInstance();
    if (_prefs.containsKey('isLoggedIn')) {
      _user = await _auth.currentUser();
      _login = _user != null;
      _loading = false;
       dateUser();
      notifyListeners();
    } else {
      _loading = false;
      notifyListeners();
    }
  }

  isError() => _error;
  isMsn() => _mensaje;
  isidUser() => _prefs.getString('idUser');
  islogin() => _login;
  isloading() => _loading;
  FirebaseUser currentUser() => _user;

  Future<bool> signUp(
      String nombre, String correo, String numero, String pass) async {
    _loading = true;
    _error = false;
    notifyListeners();
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: correo, password: pass);
      result.user.sendEmailVerification();
      Firestore.instance.collection('users').document(result.user.uid).setData({
        "nombre": nombre.toUpperCase(),
        "correo": correo,
        "numero": numero,
        "uid": result.user.uid,
      }).catchError((e) {
        print(e.code);
        salioError(tipeerror(e.code));
        return false;
      });
      setMensaje(
          "Te enviamos un correo de verificación, entra al link para activar tu cuenta.");
      _loading = false;
      notifyListeners();
      return true;
    } on PlatformException catch (e) {
      print(">>>>>>>>>>>>>>>>>>>><<");
      print(e.code);
      salioError(tipeerror(e.code));
      return false;
    }
  }

  Future<void> loginIn(String correo, String pass) async {
    _loading = true;
    _error = false;
    notifyListeners();
    try {
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: correo, password: pass);
      if (result.user.isEmailVerified) {
        _user = result.user;
        if (_user != null) {
          _prefs.setBool('isLoggedIn', true);
          _login = true;
          _loading = false;
          dateUser();
          notifyListeners();
        } else {
          _login = false;
          _loading = false;
          notifyListeners();
        }
      } else {
        salioError(
            'Este correo no esta verificado\n Por favor, revisa tu correo.');
      }
    } catch (e) {
      _login = false;
      _loading = false;
      salioError(tipeerror(e.code));
      notifyListeners();
    }
  }

  void salioError(String s) async {
    _loading = false;
    _error = true;
    errorM = s;
    notifyListeners();
    await new Future.delayed(const Duration(seconds: 6));
    _error = false;
    errorM = "";
    notifyListeners();
  }

  void logout() {
    _error = false;
    _prefs.clear();
    _login = false;
    _auth.signOut();
    notifyListeners();
  }

  void setMensaje(String s) async {
    _loading = false;
    _mensaje = true;
    infoM = s;
    notifyListeners();
    await new Future.delayed(const Duration(seconds: 6));
    _mensaje = false;
    infoM = "";
    notifyListeners();
  }

  Future<DocumentSnapshot> dateUser() async {
    dataUser =
        await Firestore.instance.collection('users').document(_user.uid).get();
    notifyListeners();
  }

  Stream<List<UserModel>> getUserList() {
    return _db.collection('user').snapshots().map((snapShot) =>
        snapShot.documents
            .map((document) => UserModel.fromJson(document.data))
            .toList());
  }
}
