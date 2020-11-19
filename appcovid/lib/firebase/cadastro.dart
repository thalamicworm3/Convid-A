import 'package:cloud_firestore/cloud_firestore.dart';

class Cadastro {
  String nome;
  String curso;
  String idade;
  String email;
  String trabalho;
  String telefone;
  String statuscovid;

  DocumentReference reference;

  Cadastro(this.nome,
      {this.curso,
      this.email,
      this.idade,
      this.trabalho,
      this.telefone,
      this.statuscovid,
      this.reference});

  factory Cadastro.fromSnapshot(DocumentSnapshot snapshot) {
    Cadastro novoCadastro = Cadastro.fromJson(snapshot.data);
    novoCadastro.reference = snapshot.reference;
    return novoCadastro;
  }

  factory Cadastro.fromJson(Map<dynamic, dynamic> json) =>
      _CadastroFromJson(json);

  Map<String, dynamic> toJson() => _SugestaoToJson(this);
}

Cadastro _CadastroFromJson(Map<dynamic, dynamic> json) {
  return Cadastro(
    json['nome'] as String,
    curso: json['curso'] as String,
    idade: json['idade'] as String,
    email: json['email'] as String,
    trabalho: json['trabalho'] as String,
    telefone: json['telefone'] as String,
    statuscovid: json['statuscovid'] as String,
  );
}

Map<String, dynamic> _SugestaoToJson(Cadastro instance) => <String, dynamic>{
      'nome': instance.nome,
      'curso': instance.curso,
      'idade': instance.idade,
      'email': instance.email,
      'trabalho': instance.trabalho,
      'telefone': instance.telefone,
      'statuscovid': instance.statuscovid,
    };
