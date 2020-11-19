import 'package:appcovid/firebase/cadastro.dart';
import 'package:appcovid/firebase/data_cadastro.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appcovid/menu.dart';
import 'package:appcovid/cadastropage.dart';
import 'package:appcovid/models/usuario.dart';
import 'package:appcovid/firebase/profile.dart';

class Respostafim extends StatelessWidget {
  final CadastroRepository repository = CadastroRepository();
  Respostafim();

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
          return WillPopScope(
              onWillPop: () async => false,
              child: Scaffold(
                  backgroundColor: Colors.blue[100],
                  appBar: AppBar(
                    title: Text('Baixa Chance de Contaminação'),
                    backgroundColor: cor,
                    automaticallyImplyLeading: false,
                  ),
                  body: ListView(
                    children: <Widget>[
                      new Image.asset(
                        'assets/images/covidbaixa.jpg',
                        width: 600,
                        height: 240,
                        fit: BoxFit.cover,
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 5, bottom: 25),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                          ),
                          child: Text(
                            "De acordo com as respostas e sintomas selecionados, a chance de contaminação pela covid-19 é baixa. Tome todos os cuidados necessários, para evitar a contaminação e a proliferação do vírus.",
                            textAlign: TextAlign.center,
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
                                statuscovid: "Baixa"); 
                            repository.addSugestao(novoCadastro); */
                            await DatabaseService(uid: user.uid).updateUserData(
                                _nomeAtual ?? userData.nome,
                                _ocupacaoAtual ?? userData.cargo,
                                _idadeAtual ?? userData.idade,
                                _emailAtual ?? userData.email,
                                _telefoneAtual ?? userData.telefone,
                                _statuscovidAtual = "Baixa Chance de Infecção");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenuScreen()),
                            );
                          },
                          child: Text(
                            "Finalizar Consulta",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      )
                    ],
                  )));
        });
  }
}
