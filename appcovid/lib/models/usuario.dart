class User {
  final String uid;
  User({this.uid});
}

class UserData {
  final String uid;
  final String nome;
  final String email;
  final String telefone;
  final String idade;
  final String cargo;
  final String statuscovids;
  UserData(
      {this.uid,
      this.nome,
      this.email,
      this.telefone,
      this.idade,
      this.cargo,
      this.statuscovids});
}
