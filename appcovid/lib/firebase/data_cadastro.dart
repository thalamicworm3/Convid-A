import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appcovid/firebase/cadastro.dart';

class CadastroRepository{
  
  CollectionReference collection = Firestore.instance.collection('usuarios');

  Stream<QuerySnapshot> getStream(){
    return collection.snapshots();
  }

  Future<DocumentReference> addSugestao(Cadastro cadastro){
    return collection.add(cadastro.toJson());
  }

  removeSugestao(Cadastro cadastro)async{
    await collection.document(cadastro.reference.documentID)
      .delete();
  }
  
  updateSugestao(Cadastro cadastro) async {
    await collection.document(cadastro.reference.documentID).updateData(cadastro.toJson());
  }
  
}