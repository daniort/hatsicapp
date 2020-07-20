import 'package:cloud_firestore/cloud_firestore.dart';

class RestauranServices {
  Future<QuerySnapshot> allRestaurantes() async {
    final a = await Firestore.instance
        .collection('restaurantes')
        //.where("topic", isEqualTo: "flutter")
        .snapshots();
        
  }
}
