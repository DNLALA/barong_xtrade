import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods {
  Future<void> addDate(tarnData) async {
    FirebaseFirestore.instance
        .collection('trans')
        .add(tarnData)
        .catchError((e) {
      print(e);
    });
  }
}
