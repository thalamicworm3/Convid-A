import 'package:appcovid/firebase/profile.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appcovid/menu.dart';
import 'package:appcovid/cadastropage.dart';
import 'package:appcovid/services/auth.dart';
import 'package:appcovid/models/usuario.dart';

class Profiletela extends StatelessWidget {
  Profiletela();

  String _nomeAtual,
      _emailAtual,
      _idadeAtual,
      _ocupacaoAtual,
      _telefoneAtual,
      _statuscovidAtual;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;

          _nomeAtual = userData.nome;
          _emailAtual = userData.email;
          _idadeAtual = userData.idade;
          _ocupacaoAtual = userData.cargo;
          _telefoneAtual = userData.telefone;

          return Scaffold(
              backgroundColor: Colors.blue[100],
              appBar: AppBar(
                title: Text('Perfil'),
                automaticallyImplyLeading: false,
                actions: <Widget>[
                  FlatButton.icon(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MenuScreen()),
                        );
                      },
                      icon: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      label: Text('Menu'),
                      textColor: Colors.white),
                ],
                backgroundColor: cor,
              ),
              body: ListView(
                children: <Widget>[
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 25, bottom: 25),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                      child: Text(
                        " Nome: $_nomeAtual\n\n Email: $_emailAtual\n\n Ocupação: $_ocupacaoAtual\n\n Idade: $_idadeAtual\n\n Telefone: $_telefoneAtual ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  ButtonTheme(
                    height: 50,
                    minWidth: 250,
                    buttonColor: Colors.blue,
                    child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)),
                      color: Colors.blue,
                      onPressed: () async {
                        /* Cadastro novoCadastro = Cadastro(nomep,
                          curso: cursop,
                          idade: idadep,
                          email: emailp,
                          trabalho: trabalhop,
                          telefone: telefonep,
                          statuscovid: "Alta");
                      repository.addSugestao(novoCadastro); 
                        await DatabaseService(uid: user.uid).updateUserData(
                            _nomeAtual ?? userData.nome,
                            _ocupacaoAtual ?? userData.cargo,
                            _idadeAtual ?? userData.idade,
                            _emailAtual ?? userData.email,
                            _telefoneAtual ?? userData.telefone,
                            _statuscovidAtual = "Infectado Verificado"); */
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AlterarPerfil()),
                        );
                      },
                      child: Text(
                        "Alterar Informações",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  )
                ],
              ));
        });
  }
}
