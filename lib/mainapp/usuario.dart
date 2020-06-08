import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  String nameUser, email, name, lastName;
  DocumentReference reference;

  Usuario({
    this.name, 
    this.lastName, 
    this.nameUser, 
    this.email
  });

  Usuario.fromMap(Map<String, dynamic> map, {this.reference})
    : assert(map['nameUser'] != null),
      assert(map['email'] != null),
      nameUser = map['nameUser'],
      email = map['email'];

  Usuario.fromSnapshot(DocumentSnapshot snapshot)
  : this.fromMap(snapshot.data, reference: snapshot.reference);
}




class Comentario {
  String content, date, nameUser;
  DocumentReference reference;

  Comentario({this.content, this.date, this.nameUser});

  Comentario.fromMap(Map<String, dynamic> map, {this.reference})
    : /*assert(map['nameUser'] != null),
      assert(map['content'] != null),
      assert(map['date'] != null),*/
      nameUser = map['nameUser'],
      content = map['content'],
      date = map['date'];

  Comentario.fromSnapshot(DocumentSnapshot snapshot)
    : this.fromMap(snapshot.data, reference: snapshot.reference);
}