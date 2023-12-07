import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

var db = FirebaseFirestore.instance;

class FirebaseOperations {
  static addUserData(String mobileNo, String name, String surname) {
    String resp = '';
    final transaction = <String, dynamic>{
      "mobileno": mobileNo,
      "name": name,
      "surname": surname,
      "tr_dt": DateTime.now().toString(),
    };
    db.collection("rajkotappuserdata").add(transaction).whenComplete(() {
      resp = 'User added successfully';
    });
    //     .catchError((e) {
    //   resp = e.toString();
    // });
    return resp;
  }

  static Stream<QuerySnapshot> fetchuserdata() {
    CollectionReference transaction = db.collection("rajkotappuserdata");
    return transaction.snapshots();
  }
}
