import 'package:appcovid/models/usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appcovid/firebase/profile.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  // anonimo

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // login email e senha

  Future logarEmailESenha(String email, String senha) async {
    try {
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: email, password: senha);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // registrar

  Future registrarEmailESenha(String email, String senha, String nome,
      String idade, String telefone, String curso, String trabalho) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: senha);
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid).updateUserData(
          nome, curso, idade, email, telefone, 'Não Quantificado');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // log out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
