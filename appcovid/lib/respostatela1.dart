import 'package:appcovid/firebase/cadastro.dart';
import 'package:appcovid/firebase/data_cadastro.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appcovid/menu.dart';
import 'package:appcovid/cadastropage.dart';

class Respostatela1 extends StatelessWidget {
  final CadastroRepository repository = CadastroRepository();
  Respostatela1();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text('Covid Positivo'),
              backgroundColor: cor,
            ),
            body: ListView(
              children: <Widget>[
                new Image.asset(
                  'assets/images/covidpositivo.jpg',
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
                      "De acordo com a resposta enviada, você ainda está infectado, devido o tempo de cura do vírus ser de em média 15 dias, por favor procure atendimento médico o mais rápido possível e evite contato, assim evitando a proliferação do vírus. (Nome:$nomep | Curso:$cursop | Idade:$idadep | Email:$emailp)",
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
                    onPressed: () {
                      Cadastro novoCadastro = Cadastro(
                        nomep,
                        curso: cursop,
                        idade: idadep,
                        email: emailp,
                        statuscovid: "Alta");
                        repository.addSugestao(novoCadastro);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MenuScreen()),
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
  }
}
