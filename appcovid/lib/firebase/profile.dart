import 'package:appcovid/authentication/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appcovid/models/usuario.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference usuarioCollection =
      Firestore.instance.collection('usuarios');

  Future updateUserData(String nome, String curso, String idade, String email,
      String telefone, String statscovid) async {
    return await usuarioCollection.document(uid).setData({
      'nome': nome,
      'encargo': curso,
      'idade': idade,
      'email': email,
      'telefone': telefone,
      'status_covid': statscovid,
    });
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        nome: snapshot.data['nome'],
        email: snapshot.data['email'],
        cargo: snapshot.data['encargo'],
        idade: snapshot.data['idade'],
        telefone: snapshot.data['telefone'],
        statuscovids: snapshot.data['status_covid']);
  }

  Stream<QuerySnapshot> get usuarios {
    return usuarioCollection.snapshots();
  }

  Stream<UserData> get userData {
    return Firestore.instance
        .collection('usuarios')
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
