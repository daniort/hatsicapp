class UserModel {
  String nombre;
  String correo;
  String telefono;
  String uid;

  UserModel({this.nombre, this.correo, this.telefono, this.uid});

  UserModel.fromJson(Map<String, dynamic> parsedJSON)
      : nombre = parsedJSON['name'],
        correo = parsedJSON['age'],
        telefono = parsedJSON['telefono'];
}
